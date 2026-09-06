# Configuração — Economia

> Atualizado: 2026-09-06 · Ficheiros: `Vault/config.yml`, `Essentials/config.yml`, `KillMoney/config.yml`, `BaltopPlugin/config.yml`, `RichReveal/config.yml`

## Vault
- `config.yml`: só `update-check: true` (config default).

## EssentialsX (economia)
- Símbolo: `$` (sufixo desligado). `starting-balance: 0`.
- `max-money: 10000000000000`, `min-money: -10000`.
- `economy-log-enabled: false`.
- `sethome-multiple`: `default: 5`, `vip: 5`, `staff: 10`, `player: 5` → contexto: o SurvivalProgression gere homes por licenças, ver `progressao.md`.
- `baltop-requirements`: minimum-balance 0, minimum-playtime 0, limit -1. `list:` → `Admins: owner admin` (LIST de grupos visível para staff).
- Comandos custados (`command-costs:`): vazio. `pay` mínimo 0.001; `npcs-in-balance-ranking: false`.
- `worth.yml`: lista extensa de valores de venda (ex.: `diamond: 200`, `diamondblock: 2000`, `log: 2`, `wool: 20`, `coal: 15`, `obsidian: 130`, `goldenapple: 100`). Itens não listados não podem ser vendidos pelo Essentials (mas o CommunityShop tem preços próprios).
- `tpr.yml`: `/tpr` exclui biomas aquáticos (oceanos/rios).

## KillMoney
- Paga por kill usando Vault. Montantes em `KillMoney/config.yml` (config lida; montantes por mob). Admin: `/killmoney reload`.
- Depende de Vault. api-version 26.2.

## BaltopPlugin
- GUI de leaderboard Vault (`/baltop`). Sem mounts adicionais em config além dos defaults (refresh/limites não personalizados — confirmar em runtime).

## RichReveal
- Revela periodicamente (em chat, com barra de texto) a localização do **jogador online mais rico**, para fomentar PvP/bounty. Admin: `/richreveal reload|now`. Intervalo configurado em `RichReveal/config.yml`.

## Notas de economia após o wipe
- Saldos de jogadores foram limpos (EssentialsX recomeça com `starting-balance: 0`).
- O CommunityShop recriou prices/stock (dinâmicos por oferta/procura) — ver `loja-community-shop.md`.