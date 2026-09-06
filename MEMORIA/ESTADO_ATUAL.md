# ESTADO ATUAL

> Atualizado: 2026-09-06 · Sessão: [SESSOES/2026-09-06.md](SESSOES/2026-09-06.md)

## Resumo

O projeto `SERVER PLUGINS` é um **pacote de plugins + configurações** para um servidor Minecraft (aparentemente **Paper / Minecraft 1.26.2**, pelos `api-version: 26.2` dos plugins custom). Não contém código-fonte, worlds, nem servidor.jar — **só a pasta `plugins`** pronta a copiar para um servidor.

A pasta de entrega é:
- `download (12)\plugins` (raiz do conteúdo real)

O pacote inclui o **script/manual de WIPE ("wipe total")** (`WIPE-LEIA-ME.txt`), que já foi **aplicado**: os dados persistentes foram limpos e as bases de dados voltaram ao mínimo (ficheiros SQLite/H2 recriados, quase vazios).

## Estado geral

- ✅ Estrutura de plugins completa (30 jars, incluindo 1 desativado).
- ✅ Configurações customizadas presentes e coerentes (economia, progressão, loja, combate, proteção de mundo, TAB).
- ✅ Wipe aplicado conforme `WIPE-LEIA-ME.txt` (LD: dados essenciais apagados).
- ⚠️ **Servidor ainda NÃO pronto para gameplay total** — dados que o wipe apagou terão de ser recriados em runtime:
  - **LuckPerms** limpo → **grupos/permissões têm de ser recriados** (o TAB espera grupos `owner, admin, mod, helper, builder, vip, default`; o SurvivalProgression espera ranks próprios).
  - **WorldGuard** só tem a região `spawn` e `__global__` → regiões de jogadores apagadas.
  - **Shopkeepers** limpo → lojas de jogadores apagadas.
  - **LoginSecurity** limpo → todas as contas de login por apagar/recriar.
  - **EssentialsX** sem dados de jogadores (homes/economia antigas limpas) — a economia recomeça em 0.
  - **CommunityShop** prices/stock/slots recriados (os atuais são os "default pós-wipe"; ver `loerx-communityshop`).

## Pendências / notas rápidas (detalhes em PROBLEMAS/)

1. `CombatLogX.zip` ainda está dentro de `plugins/` — o `README.TXT` manda apagá-lo.
2. `PlaceholderAPI` duplicado: `PlaceholderAPI-2.12.3.jar` e `PlaceholderAPI-2.12.3 (2).jar` (conteúdo idêntico em tamanho).
3. `HomesPanel-1.0.0.jar.disabled` (intencional — substituído pelo SurvivalProgression; homes importadas).
4. Pasta `Bounty/` órfã (config legacy) — sem jar; o plugin de bounty ativo é o **SpruceBounty**.
5. `DeluxeMenus/config.yml` referencia ficheiros de menu (`basics_menu.yml`, `advanced_menu.yml`, `requirements_menu.yml`) que **não existem** na pasta → menus não carregam.
6. Softdependencies referenciadas mas ausentes (opcionais): `DecentHolograms`, `loerx-currency`, `SpruceSettings`, `RedisBungee`, Factions, SuperVanish.
7. Discrepâncias menores de texto/mensagens (ex.: emoji/acentos corrompidos em alguns literais e preço da crate pedido como "100.000$" vs `500000.0` no config).

## Inventário resumido de plugins (30 elementos)

| Estado | Plugin |
|---|---|
| Ativo | BaltopPlugin 1.0.0-DUPEFIX · BlueSlimeCore 2.9.9.529 · ChestCommands · CombatLogX (11.6.0) · DeluxeMenus 1.14.1 · EssentialsX 2.22.0 · EssentialsXSpawn 2.22.0 · InfinityStones 1.47-26.2.2 · KillMoney 1.0.0 · loerx-communityshop 1.2-FIXED · LoginSecurity 3.3.1 · LuckPerms 5.5.0 · PlaceholderAPI 2.12.3 · PlayerHeadDrops 2.0.0 · ProtocolLib · RichReveal 1.0.0 · Shopkeepers 2.27.0 · SkinsRestorer · SpawnerSpawnPoint 1.0.0 · SpruceBounty 1.0.1 · SurvivalProgression 1.0.1-FIXED · TAB 6.1.0 · Vault · voicechat 2.6.21 · WildStacker 2026.2 · WorldEdit 7.4.4 · WorldGuard 7.0.17 |
| Desativado | HomesPanel 1.0.0 (`HomesPanel-1.0.0.jar.disabled`) |
| A apagar | CombatLogX.zip · PlaceholderAPI-2.12.3 (2).jar (uma das cópias) |

Detalhe jar a jar: [CONFIGURACAO/plugins-inventario.md](CONFIGURACAO/plugins-inventario.md).