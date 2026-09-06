# ARQUITETURA

> Atualizado: 2026-09-06

## Visão geral

Servidor Minecraft **Paper 1.26.2** (estimado pelos `api-version: 26.2` dos plugins custom). O pacote `plugins/` é totalmente autónomo: nada de worlds/servidor está incluído — apenas é copiado para a pasta `plugins` de um servidor existente.

```
                            ┌──────────────────────────────┐
        PLAYER ───────────▶ │  TAB 6.1.0 (tablist/scoreboard)│
        (login)             └──────────────┬───────────────┘
                            ┌──────────────▼───────────────┐
                            │  LoginSecurity (auth )       │
                            └──────────────┬───────────────┘
                            ┌──────────────▼───────────────┐
                            │  LuckPerms 5.5.0 (perms,H2)  │◀──── Vault (economia/economy bridge)
                            └──────────────┬───────────────┘              │
                            ┌──────────────▼───────────────┐     ┌────────▼────────┐
                            │  EssentialsX 2.22.0          │◀────│  Vault          │
                            │  (spawn, kit, /sell, …… )    │     └─────────────────┘
                            └──────────────┬───────────────┘
                            ┌──────────────▼───────────────┐
                            │  SURVIVAL PROGRESSION 1.0.1  │  ← núcleo do gameplay:
                            │  ranks·licenças·homes·EC·    │    intercecao /shop (spawners),
                            │  crafting·kits·anti-farm     │    /home /sethome /homes /ec /craft
                            └──────────────┬───────────────┘
```

## Camadas / subsistemas

### 1. Economia (Vault como ponte)
- **Vault** = API de economia no jogo.
- **EssentialsX** fornece o saldo (déf. arranque `0`, símbolo `$`, `max-money` alto, `min-money -10000`).
- Consumidores de Vault: **SurvivalProgression** (compras de ranks/licenças/spawners), **loerx-communityshop** (compra/venda), **SpruceBounty** (colocar/levantar bounties), **InfinityStones** (crate 500.000), **BálticoBALT** (Baltop), **KillMoney** (pagamento por kill).
- **KillMoney 1.0.0**: paga dinheiro ao matar (montantes em `CONFIGURACAO/economia.md`).
- **BaltopPlugin**: leaderboard GUI de saldos (`/baltop`).

### 2. Progressão (SurvivalProgression 1.0.1-FIXED)
Núcleo de progressão do servidor — ver [CONFIGURACAO/progressao.md](CONFIGURACAO/progressao.md) e [FUNCIONALIDADES/progressao.md](FUNCIONALIDADES/progressao.md):
- 9 ranks (AVENTUREIRO → LENDARIO) com preço/horas/kills/mobs/blocos.
- 14 licenças (HOMES 6–10, SPAWNER I–IV, EC remoto/caixas, CRAFT, DIAMOND_ARSENAL, NETHERITE_ARSENAL).
- Venda de spawners através do **/shop** (intercepta o CommunityShop; preços e limites próprios).
- Gestão de **homes** (importou do HomesPanel), **Ender Chest expandido**, crafting portátil, kits, anti-killfarm.

### 3. Loja (loerx-communityshop 1.2-FIXED)
- Loja comunitária por oferta/procura: `prices.yml`/`stock.yml`/`slots.yml` recriados após wipe.
- 17 categorias (incl. `spawnerek` para spawners — geridos pelo SurvivalProgression).
- `custom_shops.yml` vazio (nenhuma loja custom definida).

### 4. Combate / PvP
- **CombatLogX 11.6.0** (+ BlueSlimeCore): tag de combate 20s, punição por logout (**morte no disconnect — `kill-time: QUIT`**), bypass `combatlogx.bypass`, integrações WG/EssentialsX (ver [CONFIGURACAO/combate.md](CONFIGURACAO/combate.md)).
- **PlayerHeadDrops 2.0.0**: drop de cabeça do jogador em PvP (100%), anúncio global, anti-farm.
- **InfinityStones 1.47-26.2.2**: 6 Joias do Infinito + crate (preço config `500000.0`).
- **SpruceBounty 1.0.1**: sistema de bounties (recompensa por cabeça).
- PvP permitido no global (WorldGuard `__global__: pvp allow`); proibido na região `spawn`.

### 5. Mundo / proteção
- **WorldGuard 7.0.17** + **WorldEdit 7.4.4**: região `spawn` (sem PvP/explosões), `__global__` com PvP, claims de 7 regiões/jogador (máx. 30.000 blocos).
- **WildStacker 2026.2**: stacking de entidades/spawners (limitless 64), spawner upgrades Coal→Iron→Gold→Diamond (10k/25k/75k/120k).

### 6. Progressão social / extras
- **TAB 6.1.0**: tablist/scoreboard "Gameplay CV", prefixos via LuckPerms, SO = PT-BR.
- **Shopkeepers 2.27.0**: lojas de NPC (jogadores).
- **SkinsRestorer**: skins custom.
- **voicechat 2.6.21**: voz (UDP 56898).
- **LoginSecurity 3.3.1**: autenticação (registo obrigatório) — SQLite local.
- **EssentialsX**: spawn, kits, warps/menu (ChestCommands), `/tpr` (sem biomas aquáticos), MOTD.
- **RichReveal 1.0.0**: revela periodicamente a localização do jogador online mais rico.

### 7. Dependências de infra
- **ProtocolLib** (LoginSecurity/CombatLogX/…), **PlaceholderAPI 2.12.3** (expansões p/ TAB/outros), **BlueSlimeCore** (lib do CombatLogX), **bStats**+**spark** (métricas/perf).

## Armazenamento de dados

| Plugin | Engen                                              | Ficheiro |
|---|---|---|
| LuckPerms | H2 | `LuckPerms/luckperms-h2-v2.mv.db` |
| LoginSecurity | SQLite | `LoginSecurity/LoginSecurity.db` |
| SpruceBounty | SQLite | `SpruceBounty/bounty.db` |
| WildStacker | SQLite | `WildStacker/database.db` |
| WorldGuard | SQLite (cache) | `WorldGuard/cache/profiles.sqlite` |
| SurvivalProgression | YAML | `SurvivalProgression/data.yml` |
| EssentialsX | YAML/bin | `Essentials/users/…`, usermap, uuids |
| loerx-communityshop | YAML | prices/stock/slots |

> Todos os dados persistentes foram **recriados vazios após o wipe** (ficheiros SQLite/H2/minúsculos). Ver [DATABASE/README.md](DATABASE/README.md).

## Servidor "esperado"
- `server: global` (LuckPerms) — servidor único, sem rede de servidores.
- TAB tem bloco "Suporte Proxy" ligado com `RedisBungee`, mas **não há evidência de proxy** — provavelmente sobra de config default (ver PROBLEMAS/).
- Worlds referenciadas em configs: `world`, `world_nether`, `world_the_end` + referências a `world_the_lobby` e `creative_world` (PlayerHeadDrops). NOTA: não existem worlds neste pacote — só as configs dos 3 mundos padrão.