# HISTÓRICO — Breaking Changes

> Atualizado: 2026-09-06

Alterações que quebram ou mudam contratos/comportamento entre versões, com o que é preciso saber:

## BC-001 · Homes: HomesPanel → SurvivalProgression
- Comandos de home migrados. O SurvivalProgression **sobrepõe** `/sethome`, `/home`, `/homes`, `/delhome` do EssentialsX.
- O limite de homes deixa de ser o `sethome-multiple` do Essentials; passa a ser definido por **licença** (base + HOME_6…HOME_10).
- Homes antigas do HomesPanel: importadas (`data.yml`, `homes-imported: true`). Se a importação falhar em algum jogador, a home antiga perde-se.

## BC-002 · Venda de spawners agora exige licença
- O `/shop` antigo vendia spawners livremente; com `shop-command-intercept: true` é preciso **licença SPAWNER_I–IV** para comprar/ver certos tipos (ZOMBIE/SKELETON ~800.000 → … → IRON_GOLEM com SPAWNER_IV).
- Mudança de comportamento para os jogadores: **spawners deixam de ser adquiríveis no 1.º dia**.

## BC-003 · Wipe (reset de temporada)
- **Tudo o que é progressão/economia/perms/regiões/lojas/contas foi apagado.** Não há rollback — o servidor recomeça vazio.
- LuckPerms recomeça sem grupos → **sem prefixos/perms até se recriarem os grupos**.
- LoginSecurity recomeça sem contas → **todos os jogadores se re-registam** (e quem reivindica(a) o nome pode roubá-lo — considerar migração se necessário).

## BC-004 · CommunityShop "FIXED"
- O CommunityShop antigo foi substituído pelo `loerx-communityshop-1.2` patched; configs/stock/prices/slots foram substituídos pelos `patched/` → preços/stock recomeçam dos defaults.
- Comandos `shopedit/shopprice/shopmode/shopcreate/…` novos em relação ao plugin anterior.

## BC-005 · Biblioteca sqlite-jdbc (SpruceBounty)
- O SpruceBounty precisa de **largada que chegue à Maven Central no primeiro arranque** (baixa `sqlite-jdbc`; depois fica em cache). Em servidor offline isso falha → plugin desativa-se limpo.

## BC-006 · api-version 26.2
- Vários plugins custom (KillMoney, SurvivalProgression, SpawnerSpawnPoint, SpruceBounty, InfinityStones) exigem **Minecraft/Paper 1.26.x** (`api-version: 26.2`). Não funcionam em servidores antigos.