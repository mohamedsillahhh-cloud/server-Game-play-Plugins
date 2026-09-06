# Configuração — Progressão (SurvivalProgression + SpawnerSpawnPoint)

> Atualizado: 2026-09-06 · Ficheiros: `SurvivalProgression/config.yml`, `SurvivalProgression/data.yml`, `SpawnerSpawnPoint/config.yml`, `SpawnerSpawnPoint/spawns.yml`

## SurvivalProgression 1.0.1 (jar `1.0.1-FIXED`)

Comandos: `/progress` (alias progresso/rank/licencas), `/home`, `/homes`, `/sethome`, `/delhome`, `/ec`, `/craft`.
Permissões: `survivalprogression.admin` (op), `survivalprogression.use` (true).
Softdeps: Vault, Essentials, LuckPerms, WildStacker, loerx-communityshop.

### Ranks (config.yml `ranks:`)
A progressão vai de **AVENTUREIRO** a **LENDARIO** (9 ranks). Cada rank tem requisitos/preço próprios (preço em $, horas, kills, mobs específicos, blocos). Valores exatos: consultar `config.yml` (não copiados aqui para evitar duplicação — a config é a fonte da verdade).

### Licenças (config.yml `licenses:`)
14 licenças compráveis:
- **Homes:** HOME_6, HOME_7, HOME_8, HOME_9, HOME_10 (sobre a home base).
- **Spawners:** SPAWNER_I, SPAWNER_II, SPAWNER_III, SPAWNER_IV (desbloqueiam tipos específicos de spawner).
- **Ender Chest:** EC_REMOTE (abrir EC remotamente), EC_36, EC_45, EC_54 (tamanho/caixas).
- **Crafting:** CRAFT (crafting portátil).
- **Arsenal:** DIAMOND_ARSENAL, NETHERITE_ARSENAL.

### Habilidades/bloqueios ativos
Interceção do comando **`/shop`** (`shop-command-intercept: true`): reabre/limita a loja para esconder **spawners** até o jogador ter licença (o CommunityShop deixa de vender spawners livremente).
- **Anti-killfarm:** matar o mesmo jogador repetidamente → aviso às 3 ocorrências e demote às 6 (após intervalo; configurar tempos em `config.yml`).
- `teleport-delay: 5` s; teleport de homes com delay.
- `save-interval: 120` s (gravação periódica do `data.yml`).

### data.yml (estado persistente)
Estrutura (sem dados de jogadores):
- `meta`: ex. `started-at` (timestamp) e `homes-imported: true` (importou homes do HomesPanel).
- `players.<uuid>`: homes (nome → localização) e stats de progressão (tempo, kills, mobs, blocos, licenças compradas).

### Spawners definidos (venda/limite)
Tipos de spawner com preço/licença (fonte: config); ex.:
- ZOMBIE e SKELETON vendidos por ~800.000 (sem licença?).
- PIG/COW → exigem SPAWNER_I; BLAZE → SPAWNER_II; WITHER_SKELETON → SPAWNER_III; IRON_GOLEM → SPAWNER_IV.
Consultar valores exatos em `config.yml`.

## SpawnerSpawnPoint 1.0.1
- Permite definir um **ponto de nascimento personalizado** por tipo de spawner (`spawns.yml`), em alternativa ao comportamento default.
- Comandos: `/setspawn`, `/removespawn`, `/spawninfo` (permissões `spawnerspawn.use|remove|info`, default true).
- Integra-se com WildStacker (softdepend) para spawners empilhados.
- `spawns.yml` pode conter configurações por tipo — ver ficheiro.

## Interação com EssentialsX / CommunityShop
- O SurvivalProgression **sobrepõe** os comandos `/home`, `/sethome` etc. do Essentials (registou-os) e gere homes no `data.yml` (o Essentials ainda tem `sethome-multiple`, mas provavelmente não é o caminho usado).
- Quando o jogador não tem a licença de um spawner, o `/shop` não deve mostrar/vender esse spawner.