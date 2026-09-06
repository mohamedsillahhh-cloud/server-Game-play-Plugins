# HISTÓRICO — Remoções / Desativações

> Atualizado: 2026-09-06

| # | O quê foi removido/desativado | Como | Evidência | Data |
|---|---|---|---|---|
| R-001 | **HomesPanel** (desativado) | jar renomeado para `.disabled`; comandos `/home /sethome /homes /delhome` passam p/ SurvivalProgression | `HomesPanel-1.0.0.jar.disabled`; plugin.yml de ambos | 2026-09-06 (aprox.) |
| R-002 | **Bounty legacy** (removido do arranque) | jar removido; ficou só a pasta de config (órfã) | `Bounty/config.yml` presente, sem `Bounty.jar` | HISTÓRICO: NÃO DETERMINADO |
| R-003 | **Dados de jogadores** (wipe): economia, perms, homes, regiões, lojas NPC, contas auth, bounties, stocks, stacks, stats | script `WIPE-LEIA-ME.txt` | BDs SQLite/H2 vazias; `WIPE-LEIA-ME.txt` | ~2026-09-0x |
| R-004 | **Mensagens/encomendas antigas do CommunityShop** (prices/stock/slots) | substituídas pelas dos configs patched | `loerx-communityshop/*.yml` | ~2026-09-04 |

> NOTA: **nada foi apagado na auditoria** — o objetivo desta memória é documentar. Qualquer remoção futura precisa de ser acordada e registada aqui.