# Configuração — Combate (CombatLogX / PlayerHeadDrops / InfinityStones)

> Atualizado: 2026-09-06

## CombatLogX 11.6.0 (jar `CombatLogX.jar`) + BlueSlimeCore
Pasta: `CombatLogX/` (config.yml, commands.yml, punish.yml, language.yml; `expansions/`; `playerdata/`; `logger-*.csv` grandes).

### config.yml
- `debug-mode: false`; broadcasts on-load/enable/disable ativos.
- Sem mundos desativados. `link-pets`, `link-projectiles` (ignora EGG/ENDER_PEARL/SNOWBALL), `link-fishing-rod`, `link-tnt`: true.
- Timer: **GLOBAL 20s** (não usa permissão por tempo).
- `bypass-permission: combatlogx.bypass` (manual; OPs não têm por default).
- `self-combat: false`; `untag-on-death: true`; `untag-on-enemy-death: true`.
- `remove-no-damage-cooldown: true`; forgive request cooldown 30s / expira 10s.
- `minimum-tps: 15.0` (não marca em lag); tag reasons: todos (`*`).

### commands.yml
- `tag-command-list: []`, `untag-command-list: []`, `punish-command-list: []` → **sem comandos de castigo configurados** (a punição vem do `punish.yml`).
- `special-punish-commands-enabled: false` (bloco de exemplo desligado).

### punish.yml
- `on-disconnect: true` (punir por logout).
- `kill-time: QUIT` → **o jogador morre no momento em que sai do servidor em combate** (nasua própria terra, perde inventário).
- `on-kick: false`, `on-expire: false`. `enable-punishment-counter: true`.
- `custom-death-message-list`: *"{player} was killed for logging out during combat."* / *"instantly died due to logging out during combat."* (EN).

### Expansões presentes
`ActionBar`, `BossBar`, `CheatPrevention`, `CompatEssentialsX`, `CompatFactions`, `CompatSuperVanish`, `CompatWorldGuard`, `DamageEffects`, `DamageTagger`, `DeathEffects`, `ForceField`, `Logger` (gera CSV por data), `LootProtection`, `NewbieHelper`, `Rewards`, `Scoreboard`.
Compatíveis ausentes (Factions, SuperVanish, RedisBungee) = simplesmente inativas.

## PlayerHeadDrops 2.0.0
- `drop-chance: 1.0` (100%) · `only-pvp: true` · `drop-to-inventory: false`.
- Anti-farm: ignora suicídio/void/self-kill.
- Worlds blacklist: `world_the_lobby`, `creative_world` (não existem neste pacote — mundos a confirmar).
- Caimento com anúncio: *"☠ <killer> matou <player> e a sua cabeça caiu!"* (raio -1 = global).
- `economy.reward: 0` (não paga por cabeça); efeitos: som + partículas.
- Cabeça: name format `&eCabeça de %player%`; mob-heads off; looting off; permission-boost off.

## InfinityStones 1.47-26.2.2
`InfinityStones/config.yml` (patched para api 26.2; main `me.nate.powercrystals.InfinityStonesPatched`).

- 6 Joias + combinada:
  - POWER (item PURPLE_DYE, slot 6) · SPACE (BLUE_DYE, 4) · TIME (LIME_DYE, 16) · MIND (YELLOW_DYE, 22) · REALITY (RED_DYE, 2) · SOUL (ORANGE_DYE, 10).
  - `all` (todas): power-beam 8.0 dmg.
- Habilidades: power-beam (cooldown 2s, x0.30 dmg boost), speed (lvl 2), double-jump (cooldown 15s), space teleport (cooldown 20s), night vision, mind stun (20%), soul choke (10%), luck (lvl 2), slow-fall.
- `drop-stones-on-death: false`; `delete-stones-on-death: false`; `show-particles: true`.
- **StoneCrate:** `enabled: true`, `price: 500000.0`, animação 20 rolls, pesos iguais (1.0). 
  - ⚠️ Mensagens dizem "100.000$" — discrepância com o preço config (PROBLEMAS/).
- Permissões: `infinitystones.usestones` (true), `.getstone` (op), `.removestone`/`.equipstone` (op), `.reload` (op), `.stonecrate` (true).
- Comandos: `/gauntlet` `/getstone` `/removestone` `/equipstone` `/infinitystones` `/isreload` `/stonecrate`.