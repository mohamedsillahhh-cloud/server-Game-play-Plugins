# Configuração — Inventário de Plugins

> Atualizado: 2026-09-06 · Pasta: `download (12)\plugins`

## Jars na raiz (30 ficheiros)

| Jar | Plugin (plugin.yml) | api-version | Pasta config | Observações |
|---|---|---|---|---|
| `BaltopPlugin-1.0.0-DUPEFIX.jar` | BaltopPlugin 1.0.0 · main `dev.baltop.BaltopPlugin` | 1.20 | `BaltopPlugin/` | `/baltop` GUI; depende de Vault; softdep PAPI + DecentHolograms |
| `BlueSlimeCore-2.9.9.529.jar` | BlueSlimeCore (lib SirBlobman) | — | `BlueSlimeCore/` | lib do CombatLogX; config standard |
| `ChestCommands.jar` | ChestCommands | — | `ChestCommands/` | menu de warps `/warps` |
| `CombatLogX.jar` | CombatLogX 11.6.0 | — | `CombatLogX/` | combate/logout |
| `CombatLogX.zip` | **duplicado dele** | — | — | ⚠️ a apagar (ver README.TXT) |
| `DeluxeMenus-1.14.1-Release.jar` | DeluxeMenus 1.14.1 | — | `DeluxeMenus/` | ⚠️ menus referenciados não existem |
| `EssentialsX-2.22.0.jar` | EssentialsX 2.22.0 | — | `Essentials/` | núcleo: spawn, kits, economia |
| `EssentialsXSpawn-2.22.0.jar` | EssentialsXSpawn 2.22.0 | — | — | spawn moderno |
| `HomesPanel-1.0.0.jar.disabled` | HomesPanel 1.0.0 · main `com.openai.homespanel.HomesPanelPlugin` | 1.21 | `HomesPanel/` | ⚠️ desativado (subst. por SurvivalProgression) |
| `InfinityStones-1.47-26.2.2.jar` | InfinityStones 1.47-26.2.2 · main `me.nate.powercrystals.InfinityStonesPatched` | 26.2 | `InfinityStones/` | Joias + crate |
| `KillMoney-1.0.0.jar` | KillMoney 1.0.0 · main `com.server.killmoney.KillMoneyPlugin` | 26.2 | `KillMoney/` | paga por kill; dep Vault; `/killmoney reload` (op) |
| `loerx-communityshop-1.2-FIXED.jar` | loerx-communityshop 1.2 · main `hu.communityshop.CommunityShop` | 1.20 | `loerx-communityshop/` | shop comunitário; softdep Vault/loerx-currency/PAPI |
| `LoginSecurity-Spigot-3.3.1.jar` | LoginSecurity 3.3.1 | — | `LoginSecurity/` | auth; SQLite |
| `LuckPerms-Bukkit-5.5.0.jar` | LuckPerms 5.5.0 | — | `LuckPerms/` | perms; storage H2 |
| `PlaceholderAPI-2.12.3.jar` | PlaceholderAPI 2.12.3 | — | `PlaceholderAPI/` | placeholders |
| `PlaceholderAPI-2.12.3 (2).jar` | **duplicado** | — | — | ⚠️ manter só 1 |
| `PlayerHeadDrops-2.0.0.jar` | PlayerHeadDrops 2.0.0 | — | `PlayerHeadDrops/` | cabeça em PvP |
| `ProtocolLib.jar` | ProtocolLib | — | `ProtocolLib/` | lib de pacotes |
| `RichReveal-1.0.0.jar` | RichReveal 1.0.0 · main `cv.server.richreveal.RichRevealPlugin` | 1.20 | `RichReveal/` | revela o mais rico; dep Vault |
| `Shopkeepers-2.27.0.jar` | Shopkeepers 2.27.0 | — | `Shopkeepers/` | lojas NPC |
| `SkinsRestorer.jar` | SkinsRestorer | — | `SkinsRestorer/` | skins |
| `SpawnerSpawnPoint-1.0.0.jar` | SpawnerSpawnPoint 1.0.1 · main `cv.server.spawnerspawn.SpawnerSpawnPointPlugin` | 26.2 | `SpawnerSpawnPoint/` | /setspawn, /removespawn, /spawninfo; softdep WildStacker |
| `spruce-bounty-1.0.1.jar` | SpruceBounty 1.0.1 · main `dev.spruceworks.bounty.SpruceBountyPlugin` | 26.2 | `SpruceBounty/` | bounties; SQLite via sqlite-jdbc (descarrega da Maven Central no 1.º arranque) |
| `SurvivalProgression-1.0.1-FIXED.jar` | SurvivalProgression 1.0.1 · main `me.openai.survivalprogression.SurvivalProgressionPlugin` | 26.2 | `SurvivalProgression/` | núcleo de progressão |
| `TAB v6.1.0.jar` | TAB 6.1.0 | — | `TAB/` | tablist/scoreboard |
| `Vault.jar` | Vault | — | `Vault/` | API economía |
| `voicechat-bukkit-2.6.21.jar` | voicechat 2.6.21 | — | `voicechat/` | voz (UDP) |
| `WildStacker-2026.2.jar` | WildStacker 2026.2 | — | `WildStacker/` | stacking; SQLite |
| `worldedit-bukkit-7.4.4.jar` | WorldEdit 7.4.4 | — | `WorldEdit/` | edição de mundo |
| `worldguard-bukkit-7.0.17.jar` | WorldGuard 7.0.17 | — | `WorldGuard/` | proteção/regiões |

> Assinaturas de versão: alguns nomes de jar e versões do plugin.yml diferem (ex.: jar `SpawnerSpawnPoint-1.0.0` → plugin.yml 1.0.1; jar `SurvivalProgression-1.0.1-FIXED` → plugin.yml 1.0.1). Registar sempre a versão do plugin.yml.

## Pastas de config sem jar próprio (ou extra)

- `bStats/`, `spark/` (configs de métricas/performance).
- `Bounty/` — **legacy sem jar** (plugin antigo; ativo = SpruceBounty). Ver PROBLEMAS/.

## Comandos principais (custom)

| Plugin | Comandos |
|---|---|
| SurvivalProgression | `/progress` (alias `progresso`,`rank`,`licencas`) · `/home` `/homes` `/sethome` `/delhome` · `/ec` · `/craft` |
| SpawnerSpawnPoint | `/setspawn` · `/removespawn` · `/spawninfo` |
| KillMoney | `/killmoney reload` (admin) |
| BaltopPlugin | `/baltop` (alias `balancetop`,`btop`), perm `baltop.use` (default true) |
| RichReveal | `/richreveal [reload|now]` (admin) |
| SpruceBounty | `/bounty set|list|check|top|cancel` · `/bountyadmin remove|clear|reload` |
| loerx-communityshop | `/shop` `/sell` `/shopreload` `/shopstock` `/shopedit` `/shopprice` `/shopmode` `/shoplang` `/shopmove` `/shopdelete` `/shopcategory` `/shophelp` `/shopcurrencymotor` `/shopcurrency` `/shopdebug` `/shopcreate` `/shopadmin` |
| InfinityStones | `/gauntlet` `/getstone` `/removestone` `/equipstone` `/infinitystones` `/isreload` `/stonecrate` |
| ChestCommands | `/warps` (menu) |
| EssentialsX | `/spawn` `/kit` `/sell` `/tpr` `/pay` (…) |