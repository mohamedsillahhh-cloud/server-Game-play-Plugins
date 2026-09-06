# SERVER PLUGINS

Pack de plugins pronto a implementar para um servidor **Paper 1.26.2**.

## O que está aqui

| Pasta | Conteúdo |
|---|---|
| `server/plugins/` | O pack - jars + pastas de configuração por plugin + `MANIFEST.txt` |
| `server/config-overrides/` | Configs PRONTAS a colar que vivem fora de `plugins/` (anti-xray do Paper, opcional) |
| `_backups/` | Backups pré-alteração (não versionado) |
| `MEMORIA/` | Documentação técnica do servidor (não versionado) |

## Requisitos do servidor

- **Software:** Paper 1.26.2 (ou fork compatível)
- **Java:** 25 (o plugin `InfinityStones` e a Paper API 1.26.2 compilam para bytecode v69)
- **Vault + PlaceholderAPI** instalados (softdepend do `InfinityStones`/`BaltopPlugin`)

## Deploy

1. Descarrega/repo clone → copia `server/plugins/` para a pasta `plugins/` do servidor.
2. Mantém as **bases de dados** (`*.db`, `luckperms-h2-v2.mv.db`, `profiles.sqlite`, …) — **são versionadas de propósito**; sem elas perdem-se jogadores, homes e permissões.
3. (Opcional) Aplica os templates de **anti-xray** de `server/config-overrides/antixray/` nos ficheiros `paper-world.yml`/`paper-world-defaults.yml` do servidor (ver o `README.md` dessa pasta).
4. Arranca o servidor e valida no console (sem erros de plugins) + testes-chave:
   `/getstone`, joias/manopla, crates, `/homes` + licenças, `/baltop`, `/shop`, login.

## Notas operacionais

- **Homes:** dono único é o `SurvivalProgression` (comandos homes desativados no `Essentials`).
- **Nunca fazer reset/limpeza aos dados**: bases de dados e ficheiros de progresso (`data.yml`, `*.db`, `luckperms-h2-v2.mv.db`, `profiles.sqlite`, …) contêm conquistas dos jogadores e NÃO devem ser apagados nem limpos — nem em "wipe" nem por substituição da pasta `plugins/`.
- **Economia de kills:** `KillMoney` (recompensa/penalidade) — independente do sistema de bounties (SpruceBounty).
- Repositório **privado**: contém dados de jogadores (UUIDs, coordenadas). Não tornar público sem sanitizar.