# Configuração — Bounties (SpruceBounty 1.0.1)

> Atualizado: 2026-09-06 · Pasta: `SpruceBounty/`

## Em resumo
Sistema de recompensa por cabeça: um jogador **coloca um bounty** (montante Vault) na cabeça de outro; quem o matar **reclama** o prémio. Formato MiniMessage.

## Comandos
- `/bounty set|list|check|top|cancel [player] [amount]` (perm `sprucebounty.set|list|check|top|cancel`, default true).
- `/bountyadmin remove|clear|reload` (perm `sprucebounty.admin`, op).
- Permissão `sprucebounty.immune` (default false) → imune a bounties.

## Config (config.yml — lida)
- `min` / `max` de bounty, registo, reinício via `/bountyadmin reload`.
- Storage **SQLite** (`bounty.db`).
- O jar declara `libraries: org.xerial:sqlite-jdbc:3.49.1.0` → **no primeiro arranque precisa de acesso à Maven Central**; depois o driver fica em cache em `libraries/` do servidor.
- Softdeps: Vault (economia), PlaceholderAPI, `SpruceSettings` (ausente — opcional).

## Mensagens (messages.yml)
- `set-success`, `check-result`, `top-header`/`top-entry` (Top 10), `cancel-success` (refund), `claim-broadcast` com title/subtitle em PT (MiniMessage).
- `set-immune`, `set-below-min`, `set-above-max`, `set-insufficient-funds`, `economy-error`.

## Legacy: pasta `Bounty/`
- Existe `Bounty/config.yml` mas **não há `Bounty.jar`** (removido/substituído por SpruceBounty). Considerar órfã. Ver [PROBLEMAS/README.md](../PROBLEMAS/README.md).