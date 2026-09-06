# Configuração — EssentialsX / EssentialsXSpawn / Menus

> Atualizado: 2026-09-06 · Pasta: `Essentials/`, `ChestCommands/`, `DeluxeMenus/`

## EssentialsX 2.22.0 (`Essentials/config.yml`, ~1313 linhas)
- **Nick:** prefixo `~`, max 16, regex `^[a-zA-Z_0-9…]+$` (caráter ODiá crit no regex — PROBLEMAS/).
- **Teleportes:** cooldown 5s, delay 5s, invulnerabilidade 4s, safety on, `teleport-to-center: true`.
- **AFK:** auto-afk 300s, timeout -1, reseta em interação/movimento/chat/fish.
- **MOTD:** do ficheiro `motd.txt` (EN default: welcome/help/list/time).
- **Kits (`kits.yml`):** `tools` (delay 10s — kit default de novato), `dtools`, `notch`, `color`, `firework` (kits de exemplo). O config usa `newbies.kit: tools` (novato recebe kit `tools` no spawn).
- **Spawn:** `spawn-on-join: true`; `respawn-at-home-bed: true`; `newbies.spawnpoint: newbies`; x-posição guardada em `spawn.yml` (mundo `world`).
- **Worth (`worth.yml`):** valores de venda estilo legado (ver `economia.md`).
- **Proteção/anti-grief:** `protect.prevent` all `false` (sim, em EssentialsX o default é false), `disable: pvp false etc.` — em grande parte não protegido (a proteção fica a cargo do WorldGuard).
- **List/groups:** `list: Admins: owner admin`.
- Chat: `format: '<{DISPLAYNAME}> {MESSAGE}'`; `paper-chat-events: true`.
- Som de jogo sem custom join/quit (custom-join-message none).
- **Comandos desativados/sobregravação:** vazio por default.

## EssentialsXSpawn 2.22.0
- Plugin de spawn moderno; sem pasta própria além de `Essentials/spawn.yml`.

## ChestCommands (menu de warps)
- `ChestCommands/config.yml`: default-color, anti-click-spam 200ms.
- `warps.yml` — menu `/warps` (3 linhas, título "&8Menu de Warps") com 4 atalhos:
  - `spawn` → `/spawn` (item 399)
  - `loja` → `/warp loja` (54)
  - `mina` → `/warp mina` (278)
  - `arena` → `/warp arena` (276, "Arena PvP")

## DeluxeMenus 1.14.1
- `config.yml` refere `gui_menus: basics_menu.yml / advanced_menu.yml / requirements_menu.yml`.
- ⚠️ **Os ficheiros de menu não existem na pasta** → os menus não carregam (PROBLEMAS/).
- `check_updates: true`, `debug: LOW`.