# PROBLEMAS — Problemas / Incidências Conhecidas

> Atualizado: 2026-09-06 · Estado: ABERTO / ENCERRADO / EM ANÁLISE

## P-001 · `CombatLogX.zip` dentro de `plugins/`  — ABERTO
- **O quê:** existe `CombatLogX.zip` ao lado de `CombatLogX.jar`.
- **Impacto:** `README.TXT` (executável do plugin) manda **apagar o `.zip`** (não é carregado, mas polui a pasta e pode confundir).
- **Ação sugerida:** eliminar `download (12)\plugins\CombatLogX.zip`.

## P-002 · PlaceholderAPI duplicado  — ABERTO
- **O quê:** `PlaceholderAPI-2.12.3.jar` e `PlaceholderAPI-2.12.3 (2).jar` (tamanhos idênticos ~1.133 KB).
- **Impacto:** dois jars de plugin→ no Paper carrega duas vezes (erro/duplicado) ou falha a iniciar.
- **Ação sugerida:** apagar a cópia `(2)`.

## P-003 · `HomesPanel-1.0.0.jar.disabled` — INTENCIONAL (sem ação)
- **O quê:** jar desativado após migração de homes para SurvivalProgression.
- **Estado:** manter assim; homes já importadas (`homes-imported: true`). Apagar só após confirmação de que a migração é boa.

## P-004 · Pasta `Bounty/` órfã (legacy)  — ABERTO
- **O quê:** `Bounty/config.yml` existe sem jar `Bounty.jar`; o ativo é o SpruceBounty.
- **Ação sugerida:** apagar a pasta `Bounty/` ou movê-la para um backup.

## P-005 · DeluxeMenus sem ficheiros de menu  — ABERTO
- **O quê:** `config.yml` referencia `basics_menu.yml`, `advanced_menu.yml`, `requirements_menu.yml` que **não existem**.
- **Impacto:** os menus do DeluxeMenus **não carregam** (erros ao arranque); o plugin fica essencialmente sem uso.
- **Ação sugerida:** criar os menus desejados ou remover as referências do config.

## P-006 · Caracteres corrompidos (UTF-8) em vários configs custom  — ABERTO (cosmético)
- **O quê:** textos com acentos/emojis quebrados (ex.: `%*J* tens esta Joia equipada!`, regex de nick, mensagens InfinityStones).
- **Impacto:** mensagens mal apresentadas no jogo.
- **Ação sugerida:** reescrever literais em UTF-8 correto (atenção: são literais dentro dos jars/configs).

## P-007 · Discrepância de preço da StoneCrate  — ABERTO
- **O quê:** config pede **500.000$** mas as mensagens dizem **100.000$**.
- **Impacto:** jogador pode não ter "fundos suficientes" segundo o texto.
- **Ação sugerida:** alinhar texto ⇄ config.

## P-008 · TAB com "proxy support" ligado (RedisBungee) sem proxy  — EM ANÁLISE
- **O quê:** `proxy-support.enabled: true`, `type: PLUGIN`, `name: RedisBungee`; não há evidência de BungeeCord/Velocity neste pacote.
- **Impacto:** provavelmente inofensivo, mas pode gerar warnings.
- **Ação sugerida:** desligar (`enabled: false`) se o servidor for único.

## P-009 · Rank lists desalinhadas (TAB vs SurvivalProgression)  — EM ANÁLISE
- **O quê:** TAB ordena por `owner,admin,mod,helper,builder,vip,default` e LuckPerms foi apagado; os ranks do SurvivalProgression são AVENTUREIRO…LENDARIO (nomes diferentes).
- **Impacto:** sem recriar LuckPerms, TAB/prefixos ficam vazios/incorretos.
- **Ação sugerida:** decidir o mapa ranks ⇄ grupos LuckPerms e recriar grupos+prefixos.

## P-010 · Softdependencies referenciadas mas ausentes  — INFORMATIVO
- **O quê:** `DecentHolograms` (Baltop), `loerx-currency` (CommunityShop), `SpruceSettings` (SpruceBounty), Factions/SuperVanish (CombatLogX), RedisBungee (TAB).
- **Impacto:** só funcionalidades opcionais afetadas. Nenhuma ação obrigatória.

## P-011 · "Worlds" na config vs mundo real  — EM ANÁLISE
- **O quê:** `PlayerHeadDrops` blacklist `world_the_lobby` e `creative_world`; só existem configs para `world/world_nether/world_the_end`.
- **Impacto:** provavelmente placeholder de outro pack. Reconfirmar nomes dos mundos reais do servidor.

## P-012 · Missing espaços/acentos em `slots.yml.backup-original`  (não confirmado)
- **O quê:** ficheiro backup presente; não conclui nada de errado. Mantido para referencia.

## Registo de novas incidências
- Novos bugs → criar aqui com ID, data, impacto e estado; atualizar SESSOES/.