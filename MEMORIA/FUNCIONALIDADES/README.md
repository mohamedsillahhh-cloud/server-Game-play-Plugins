# FUNCIONALIDADES — Documentação Funcional

> Atualizado: 2026-09-06

Cada funcionalidade descreve o **comportamento esperado** (fonte: configs). Estado: ✅ ativo · ⚠️ pendente de validação em runtime.

## F-001 · Progressão (SurvivalProgression)  · ✅ ativo
- Ranks compráveis/ganháveis (AVENTUREIRO → LENDARIO) com requisitos de horas/kills/mobs/blocos.
- Licenças: Homes 6–10, Spawner I–IV, EC remoto/36/45/54, Craft, Arsenal diamante/netherite.
- Anti-killfarm (aviso às 3, demote às 6) e interceção do `/shop` para spawners.
- `data.yml`: struct `players.<uuid>` (homes + stats).

## F-002 · Loja comunitária (loerx-communityshop)  · ✅ ativo
- Compra/venda com stock dinâmico (supply-driven). 17 categorias, `/sell` em massa.
- Spawners em `spawnerek` geridos pela progressão.

## F-003 · Economia  · ✅ ativo
- Vault + EssentialsX (saldo `$`, from `starting-balance: 0`).
- KillMoney paga por kill · BaltopGUI leaderboard · RichReveal revela o mais rico.

## F-004 · Bounties (SpruceBounty)  · ✅ ativo
- `/bounty` set/list/check/top/cancel · `/bountyadmin` · refunds · broadcast PT · Top 10.
- SQLite; precisa de Maven Central no 1.º arranque.

## F-005 · Combate anti-logout (CombatLogX)  · ✅ ativo
- Tag 20s global; logout em combate = **morte** (`kill-time: QUIT`); bypass `combatlogx.bypass`.
- Logs CSV (expansão Logger), integrações WG/EssentialsX.

## F-006 · Cabeças PvP (PlayerHeadDrops)  · ✅ ativo
- 100% drop em PvP (anti-farm; sem economia); anúncio global; item "Cabeça de %player%".

## F-007 · Joias do Infinito + crate  · ✅ ativo
- 7 pedras com habilidades; crate `price: 500000.0`; pesos iguais.
- ⚠️ Discrepância de texto 100.000$ vs 500.000$.

## F-008 · Permissões (LuckPerms)  · ⚠️ recriar pós-wipe
- Groups/perms **apagados**; recriar owner/admin/mod/helper/builder/vip/default + prefixos.

## F-009 · TAB  · ✅ ativo
- Header/footer, scoreboard "Gameplay CV", playerlist com ping; locale pt-BR.

## F-010 · Proteção de mundo (WorldGuard)  · ⚠️ recriar regiões
- Região `spawn` segura (sem PvP/explosões) · `__global__` PvP allow.
- Claims: 7 por jogador, max 30.000 blocos.

## F-011 · Lojas NPC (Shopkeepers)  · ⚠️ lojas apagadas
- Lojas do jogador apagadas pelo wipe (recriar em jogo). Até 10 por jogador; sign shops etc.

## F-012 · Autenticação (LoginSecurity)  · ⚠️ registos apagados
- Registo obrigatório; contas apagadas pelo wipe → todos se re-registam.

## F-013 · Voz (voicechat)  · ✅ ativo
- Voz UDP 56898, alcance 48, grupos ativos.

## F-014 · Skins (SkinsRestorer)  · ✅ ativo
- Skins custom + command de lookup; FILE storage.

## F-015 · Warps/Menu (ChestCommands)  · ✅ ativo
- `/warps`: spawn, loja, mina, arena (atanhos).

## F-016 · Kits (EssentialsX)  · ✅ ativo
- `tools` (novato, delay 10s) + kits de exemplo (dtools, notch, color, firework).
- MOTD default EN.

## F-017 · RichReveal  · ✅ ativo
- Localização periódica do jogador mais rico (chat). Admin `/richreveal now`.

## F-018 · SpawnerSpawnPoint  · ✅ ativo
- Personaliza o ponto de surgimento dos mobs por spawner (`/setspawn`, `spawns.yml`).

## F-019 · Spawner upgrades (WildStacker)  · ✅ ativo
- Coal(10k)→Iron(25k)→Gold(75k)→Diamond(120k) · silk-touch 100% · limite 64.

## F-020 · Crafting/Ender Chest portáteis (SurvivalProgression)  · ✅ ativo
- `/craft` (licença CRAFT) e `/ec` (expandido EC_36/45/54 / remoto EC_REMOTE).

---
> Funcionalidade com estado ⚠️ = depende de dados que o wipe apagou ou de validação em jogo.