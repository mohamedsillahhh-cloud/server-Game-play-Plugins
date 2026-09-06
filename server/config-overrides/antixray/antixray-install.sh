#!/usr/bin/env bash
# =============================================================================
#  antixray-install.sh - Paper 1.26.2 (Linux/Unix)
#
#  Aplica o Anti-Xray aos ficheiros de config do servidor automaticamente.
#  - Faz backup antes de tocar.
#  - Substitui o bloco 'anti-xray' existente; se nao existir, adiciona.
#  - NAO usa /reload: depois de correr, faz RESTART do servidor.
#
#  USO:
#  1) Extrai o pack e copia a pasta 'antixray' (esta pasta) para o servidor.
#  2) Corre a partir da raiz do servidor (onde esta o server.jar):
#       chmod +x antixray/antixray-install.sh
#       ./antixray/antixray-install.sh   [ou passa o caminho como argumento]
#
#  Requer: python3 (para o merge YAML seguro). Os 3 templates
#  (01-world-defaults / 02-nether / 03-end) devem estar nesta mesma pasta.
# =============================================================================
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SERVER_ROOT="${1:-$PWD}"
T_WORLD="$DIR/01-world-defaults-antixray.yml"
T_NETHER="$DIR/02-nether-antixray.yml"
T_END="$DIR/03-end-antixray.yml"
CONFIG_DIR="$SERVER_ROOT/config"

fail() { echo "[ERRO] $*" >&2; exit 1; }

[ -f "$T_WORLD" ]  || fail "Template em falta: $T_WORLD"
[ -f "$T_NETHER" ] || fail "Template em falta: $T_NETHER"
[ -f "$T_END" ]    || fail "Template em falta: $T_END"
[ -d "$CONFIG_DIR" ] || fail "Pasta 'config' nao encontrada em: $SERVER_ROOT (corre a partir da raiz do servidor)"
command -v python3 >/dev/null 2>&1 || fail "python3 nao encontrado - precisa dele para o merge seguro"

STAMP="$(date +%Y%m%d-%H%M%S)"
BACKUP_DIR="$CONFIG_DIR/_antixray-backup-$STAMP"
REPORT="$CONFIG_DIR/_antixray-relatorio-$STAMP.txt"
mkdir -p "$BACKUP_DIR"
: > "$REPORT"

log() { echo "[Anti-Xray] $*"; echo "$*" >> "$REPORT"; }

apply() {
  local tpl="$1" target="$2" label="$3"
  if [ ! -f "$target" ]; then
    log "[AVISO] $label -> nao encontrado ($target). Se os worlds tiverem outro nome aplica manualmente (ver README)."
    return
  fi
  local bak leaf
  leaf="$(printf '%s' "$target" | sed 's|^/*||' | tr '/\\' '__')"
  bak="$BACKUP_DIR/$leaf"
  cp -f "$target" "$bak"

  python3 "$DIR/_merge.py" "$tpl" "$target" >> "$REPORT" 2>&1 && {
    log "OK  $label -> bloco anti-xray aplicado em $target"
  } || {
    log "[ERRO] $label -> falhou o merge em $target (copia anterior restaurada)"
    cp -f "$bak" "$target"
  }
}

log "Pasta do servidor: $SERVER_ROOT"
log "Backups: $BACKUP_DIR"
log "Templates: $DIR"

apply "$T_WORLD"  "$CONFIG_DIR/paper-world-defaults.yml" "Overworld"
apply "$T_NETHER" "$CONFIG_DIR/world/dimensions/minecraft/the_nether/paper-world.yml" "Nether"
apply "$T_END"    "$CONFIG_DIR/world/dimensions/minecraft/the_end/paper-world.yml" "End"

echo
echo "[Anti-Xray] CONCLUIDO. Inicia SEMPRE com RESTART completo (NAO uses /reload)."
echo "[Anti-Xray] Relatorio: $REPORT"