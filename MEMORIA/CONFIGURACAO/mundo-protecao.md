# Configuração — Mundo / Proteção (WorldGuard + WorldEdit)

> Atualizado: 2026-09-06 · Pastas: `WorldGuard/`, `WorldEdit/`

## WorldGuard 7.0.17 (`WorldGuard/config.yml`)
- Regiões ativas (`regions.enable: true`); wand = `minecraft:leather`.
- **Claims:** `max-claim-volume: 30000`; `max-region-count-per-player.default: 7`.
- `claim-only-inside-existing-regions: false`.
- `use-player-move-event: true`, `use-player-teleports: true`.
- Proteção: defaults (PvP por região; `__global__` permite PvP).
- Sinistro/explosões: ativadas por flags por região (não globalmente bloqueadas).
- `op-permissions: true`.

### Regiões (só 2 após wipe)
Ficheiro: `WorldGuard/worlds/world/regions.yml` (+ `world_nether`, `world_the_end` também com config mínimo):
- **`spawn`** (cubo): coordenadas min/max no ficheiro; flags `damage-combat: deny`, `player-combat: deny`, `mob-combat: deny`, `creeper-explosion/creeper: deny`, `ghast-fireball: deny`, `other-explosion: deny`, `tnt: deny`, `unknown-combat: deny`. → **zona segura: sem PvP, sem explosões, sem dano de combate.**
- **`__global__`**: `pvp: allow` → **PVP permitido em todo o mundo** fora do spawn.

> As regiões de jogadores foram apagadas pelo wipe — terão de ser recriadas.

## WorldEdit 7.4.4 (`WorldEdit/config.yml`)
- Básico: `wand-item: minecraft:wooden_axe`, `navigation-wand: minecraft:compass`.
- `max-radius: -1` (ilimitado), `disallowed-blocks`: saplings, beds, railes, vegetação, TNT etc. (default).
- `use-inventory.enable: false`. `history.size: 15`.
- `saving.dir: schematics`, `scripting.dir: craftscripts`.

## Mundos
- Referenciados nas configs: `world`, `world_nether` (nas configurações do WorldGuard), mais `world_the_lobby` e `creative_world` (PlayerHeadDrops). *Os ficheiros de mundo NÃO fazem parte deste pacote.*