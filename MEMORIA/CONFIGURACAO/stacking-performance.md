# Configuração — Stacking / Performance (WildStacker + spark)

> Atualizado: 2026-09-06

## WildStacker 2026.2
Pasta: `WildStacker/` · storage **SQLite** (`database.db`, limpo). Comando inspetor: sticky (tool de inspeção).

### Items
- `items.enabled: false` → stacking de items desligado.

### Entities
- `entities.enabled: true` · merge-radius `all: 10` · limite `all: 64` · limites por entidade (`all` com custom-name `&6x{0}`), partículas ativas.
- Stack-checks extensos (AGE, BREED, TAMED, NBT etc.).
- `spawn-corpses: true`; `auto-exp-pickup` lista vazia.
- `stack-down.enabled: true`; `smart-breeding: false`; `multiply-drops: true`.

### Spawners (relevante para a progressão)
- `spawners.enabled: true` · merge-radius 1 · limite `all: 64`.
- **Silk-touch:** `enabled: true`, `drop-to-inventory: true`, break-chance 100%, min-level 1.
- `explosions.enabled: false`.
- `only-one-spawner: true` (um tipo de spawner por local?) · `change-using-eggs: true`.
- `next-spawner-placement: true`.
- **Upgrades de spawner** (`spawner-upgrades.ladders.entities`):
  - `default` → **Coal**; Coal (10.000) → **Iron** (25.000) → **Gold** (75.000) → **Diamond** (120.000, sem next).
  - ícones/lore por nível; `nearby-players: 16`.

### Banco de dados
- SQLite local (`database.db`) · config mostra credenciais MySQL default (localhost/root/root) mas **não usados** — `type: SQLite`.

## spark
- `spark/config.json`: apenas `backgroundProfiler: true`.
- Métricas/performance: padrão.

## bStats
- `bStats/config.yml`: `enabled: true` (estatísticas dos plugins ativas).