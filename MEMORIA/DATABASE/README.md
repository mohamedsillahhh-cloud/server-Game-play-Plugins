# DATABASE — Inventário de Bases de Dados

> Atualizado: 2026-09-06 · Verificado por inspeção do conteúdo de `download (12)\plugins` e tamanhos de ficheiros.

## Ficheiros de BD encontrados

| Plugin | Motor | Ficheiro | Tamanho | Estado pós-wipe |
|---|---|---|---|---|
| LuckPerms | H2 | `LuckPerms/luckperms-h2-v2.mv.db` | ~88 KB | ✅ recriado (só estrutura; grupos apagados) |
| LoginSecurity | SQLite | `LoginSecurity/LoginSecurity.db` (+ `.db.3.0.backup`) | ~0,3 KB | ✅ recriado (contas apagadas) |
| SpruceBounty | SQLite | `SpruceBounty/bounty.db` | ~0,8 KB | ✅ recriado (bounties apagados) |
| WildStacker | SQLite | `WildStacker/database.db` | ~0,5 KB | ✅ recriado (dados de stacking limitados) |
| WorldGuard | SQLite (cache) | `WorldGuard/cache/profiles.sqlite` | ~0,4 KB | ✅ cache recriada |

> Os ficheiros SQLite que já existiam antes do wipe foram removidos pelo script `WIPE-LEIA-ME.txt` e recriados vazios no arranque seguinte (ou pelo plugin). **Todos os dados persistentes de jogadores foram apagados.**

## Configurações de BD por plugin

- **LuckPerms**: `config.yml` → `storage-method: h2`; `data.*` (address/database/username/password) **não utilizados** com H2.
- **LoginSecurity**: `database.yml` → MySQL `enabled: false` → usa SQLite local.
- **WildStacker**: `config.yml` → `database.type: SQLite` (bloco MySQL/credenciais presente mas inativo).
- **SpruceBounty**: usa `sqlite-jdbc` (descarregado da Maven Central no 1.º arranque).
- **WorldGuard**: cache de perfis (nomes/UUIDs) em SQLite; não é dado de jogo permanente.
- **SurvivalProgression**: não usa BD — YAML (`data.yml`).
- **EssentialsX**: YAML (`Essentials/users/`), `usermap.bin`, `uuids.bin`, `items.json` (cache de nomes).
- **loerx-communityshop**: YAML (prices/stock/slots/custom_shops).

## Regras para esta pasta
- Não copiar valores de jogadores (UUIDs, senhas hash, saldos) para a memória.
- Documentar apenas estrutura/motor/modos.
- Sempre que um ficheiro de BD mudar de motor, atualizar ESTADO_ATUAL.md.