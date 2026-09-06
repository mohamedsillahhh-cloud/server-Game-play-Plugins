# =============================================================================
#  APLICAR-ANTIXRAY.ps1  - Paper 1.26.2  (Windows)
#
#  Aplica o Anti-Xray aos ficheiros de config do servidor automaticamente.
#  - Faz backup dos ficheiros antes de tocar.
#  - Substitui o bloco 'anti-xray' existente; se nao existir, adiciona.
#  - Respeita a indentacao (2 ou 4 espacos) de cada papel config do Paper.
#  - NAO usa /reload: depois de correr, faz RESTART do servidor.
#
#  USO:
#  1) Extrai o pack e copia a pasta 'antixray' (esta pasta) para o servidor.
#  2) Corre A PARTIR DA RAIZ do servidor (onde esta o server.jar), ou passa:
#     powershell -ExecutionPolicy Bypass -File antixray/antixray-install.ps1 -ServerRoot "C:\caminho\do\servidor"
#
#  Os 3 templates (01-world-defaults / 02-nether / 03-end) devem estar
#  nesta mesma pasta.
# =============================================================================
param(
  [string]$ServerRoot = (Get-Location).Path
)

$ErrorActionPreference = 'Stop'

$tplDir     = $PSScriptRoot
$tWorld     = Join-Path $tplDir '01-world-defaults-antixray.yml'
$tNether    = Join-Path $tplDir '02-nether-antixray.yml'
$tEnd       = Join-Path $tplDir '03-end-antixray.yml'
$configDir  = Join-Path $ServerRoot 'config'

foreach ($t in @($tWorld, $tNether, $tEnd)) {
  if (-not (Test-Path -LiteralPath $t)) {
    Write-Host "[ERRO] Template em falta: $t" -ForegroundColor Red
    exit 1
  }
}

if (-not (Test-Path -LiteralPath $configDir)) {
  Write-Host "[ERRO] Nao encontrei a pasta 'config' em: $ServerRoot" -ForegroundColor Red
  Write-Host "       Corre o script a partir da raiz do servidor ou usa -ServerRoot." -ForegroundColor Yellow
  exit 1
}

$stamp     = Get-Date -Format 'yyyyMMdd-HHmmss'
$backupDir = Join-Path $configDir "_antixray-backup-$stamp"
New-Item -ItemType Directory -Path $backupDir -Force | Out-Null
$report = Join-Path $configDir "_antixray-relatorio-$stamp.txt"
$log = New-Object System.Collections.Generic.List[string]

function Write-Log([string]$m) {
  Write-Host "[Anti-Xray] $m"
  $log.Add($m)
}

# Escreve ficheiro em UTF-8 SEM BOM (compatibilidade total com YAML do Paper).
function Save-Lines([string]$path, [System.Collections.ArrayList]$lines) {
  $enc = New-Object System.Text.UTF8Encoding($false)
  [System.IO.File]::WriteAllLines($path, $lines.ToArray(), $enc)
}

function Get-Indent([string]$line) {
  return ($line.Length - $line.TrimStart(' ').Length)
}
function Is-Blank([string]$line)  { return $line.Trim().Length -eq 0 }
function Is-Comment([string]$line) { return $line.TrimStart(' ').StartsWith('#') }

# Sub-arvore 'anti-xray:' do template (root + descendentes) e indentacao do root.
function Get-AntiXrayBlock([string]$tplPath, [ref]$rootIndent) {
  $lines = Get-Content -LiteralPath $tplPath -Encoding UTF8
  $start = -1
  for ($k = 0; $k -lt $lines.Count; $k++) {
    if ($lines[$k].Trim() -eq 'anti-xray:') { $start = $k; break }
  }
  if ($start -lt 0) { throw "Template invalido: $tplPath (sem 'anti-xray:')" }
  $body = New-Object System.Collections.ArrayList
  for ($k = $start; $k -lt $lines.Count; $k++) { [void]$body.Add($lines[$k]) }
  while ($body.Count -gt 0 -and (Is-Blank ([string]$body[$body.Count - 1]))) {
    $body.RemoveAt($body.Count - 1)
  }
  $rootIndent.Value = Get-Indent ([string]$lines[$start])
  return $body
}

# Re-indenta 'body' cujas linhas estao relativas a 'baseIndent', para 'targetIndent'.
function Get-Reindented([System.Collections.ArrayList]$body, [int]$baseIndent, [int]$targetIndent) {
  $out = New-Object System.Collections.ArrayList
  foreach ($raw in $body) {
    $line = [string]$raw
    if (Is-Blank $line) { [void]$out.Add(''); continue }
    $rel = (Get-Indent $line) - $baseIndent
    if ($rel -lt 0) { $rel = 0 }
    [void]$out.Add((' ' * ($rel + $targetIndent)) + $line.TrimStart(' '))
  }
  return $out
}

# Indentacao dos filhos existentes sob a linha 'parentIdx' (ou parent+2).
function Get-ChildrenIndent([System.Collections.ArrayList]$lines, [int]$parentIdx) {
  $pInd = Get-Indent ([string]$lines[$parentIdx])
  for ($k = $parentIdx + 1; $k -lt $lines.Count; $k++) {
    $line = [string]$lines[$k]
    if ((Is-Blank $line) -or (Is-Comment $line)) { continue }
    $i = Get-Indent $line
    if ($i -le $pInd) { break }
    return $i
  }
  return ($pInd + 2)
}

# Bloco completo do template (as linhas 'anticheat:' + 'anti-xray:') para apos de tudo.
function Get-FullTemplate([string]$tplPath) {
  $lines = Get-Content -LiteralPath $tplPath -Encoding UTF8
  $start = -1
  for ($k = 0; $k -lt $lines.Count; $k++) {
    if ($lines[$k].Trim() -eq 'anticheat:') { $start = $k; break }
  }
  $body = New-Object System.Collections.ArrayList
  for ($k = $start; $k -lt $lines.Count; $k++) { [void]$body.Add($lines[$k]) }
  while ($body.Count -gt 0 -and (Is-Blank ([string]$body[$body.Count - 1]))) {
    $body.RemoveAt($body.Count - 1)
  }
  return $body
}

function Apply-Template([string]$tplPath, [string]$target, [string]$label) {
  if (-not (Test-Path -LiteralPath $target)) {
    Write-Log "[AVISO] $label -> nao encontrado ($target). Se os worlds do teu servidor tiverem outro nome, aplica manualmente (ver README)."
    return $false
  }
  $content = New-Object System.Collections.ArrayList
  foreach ($l in (Get-Content -LiteralPath $target -Encoding UTF8)) { [void]$content.Add($l) }

  $backupLeaf = ($target.Substring($ServerRoot.Length).TrimStart('\', '/') -replace '[^A-Za-z0-9._-]', '_')
  Copy-Item -LiteralPath $target -Destination (Join-Path $backupDir $backupLeaf) -Force

  $rootIndent = 2
  $block = Get-AntiXrayBlock $tplPath ([ref]$rootIndent)

  $idx = -1
  for ($k = 0; $k -lt $content.Count; $k++) {
    if ([string]$content[$k].Trim() -eq 'anti-xray:') { $idx = $k; break }
  }

  $new = $null
  if ($idx -ge 0) {
    $end = $content.Count
    for ($k = $idx + 1; $k -lt $content.Count; $k++) {
      $line = [string]$content[$k]
      if ((Is-Blank $line) -or (Is-Comment $line)) { continue }
      if ((Get-Indent $line) -le (Get-Indent ([string]$content[$idx]))) { $end = $k; break }
    }
    $new = New-Object System.Collections.ArrayList
    for ($k = 0; $k -lt $idx; $k++) { [void]$new.Add($content[$k]) }
    foreach ($l in (Get-Reindented $block $rootIndent (Get-Indent ([string]$content[$idx])))) { [void]$new.Add($l) }
    for ($k = $end; $k -lt $content.Count; $k++) { [void]$new.Add($content[$k]) }
    Save-Lines $target $new
    Write-Log "OK  $label -> bloco anti-xray SUBSTITUIDO em $target"
  } else {
    $ac = -1
    for ($k = 0; $k -lt $content.Count; $k++) {
      if ([string]$content[$k].Trim() -eq 'anticheat:') { $ac = $k; break }
    }
    $new = New-Object System.Collections.ArrayList
    if ($ac -ge 0) {
      $ci = Get-ChildrenIndent $content $ac
      for ($k = 0; $k -lt $content.Count; $k++) {
        [void]$new.Add($content[$k])
        if ($k -eq $ac) { foreach ($l in (Get-Reindented $block $rootIndent $ci)) { [void]$new.Add($l) } }
      }
      Save-Lines $target $new
      Write-Log "OK  $label -> bloco anti-xray ADICIONADO sob 'anticheat:' em $target"
    } else {
      foreach ($l in $content) { [void]$new.Add($l) }
      [void]$new.Add('')
      foreach ($l in (Get-FullTemplate $tplPath)) { [void]$new.Add($l) }
      Save-Lines $target $new
      Write-Log "OK  $label -> bloco anticheat:/anti-xray ADICIONADO no fim de $target"
    }
  }
  return $true
}

Write-Log "Pasta do servidor: $ServerRoot"
Write-Log "Backups: $backupDir"

$noneFound = $true
if (Apply-Template $tWorld  (Join-Path $configDir 'paper-world-defaults.yml') 'Overworld') { $noneFound = $false }
if (Apply-Template $tNether (Join-Path $configDir 'world\dimensions\minecraft\the_nether\paper-world.yml') 'Nether') { $noneFound = $false }
if (Apply-Template $tEnd    (Join-Path $configDir 'world\dimensions\minecraft\the_end\paper-world.yml') 'End') { $noneFound = $false }

if ($noneFound) {
  Write-Log ""
  Write-Log "Nenhum ficheiro de mundo encontrado (backups/relatorio criados na mesma)."
  Write-Log "Se os worlds do servidor tiverem outro layout/outros nomes, aplica os templates manualmente (ver README)."
} else {
  Write-Log ""
  Write-Log "CONCLUIDO. Inicia SEMPRE com RESTART completo (desligar e ligar)."
  Write-Log "NAO uses /reload."
}

$log | Set-Content -LiteralPath $report -Encoding UTF8
Write-Host ""
Write-Host "[Anti-Xray] Relatorio guardado em: $report" -ForegroundColor Green