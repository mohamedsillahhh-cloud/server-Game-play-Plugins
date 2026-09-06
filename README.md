# SERVER PLUGINS

Pack de plugins pronto a implementar para um servidor **Paper 1.26.2**.

## O que está aqui

| Pasta | Conteúdo |
|---|---|
| `server/plugins/` | O pack — jars + pastas de configuração por plugin + `MANIFEST.txt` |
| `server/plugins/MANIFEST.txt` | Lista automática: jar → plugin, versão, API, descrição |
| `_backups/` | Backups pré-alteração (não versionado) |
| `MEMORIA/` | Documentação técnica do servidor (não versionado) |

## Requisitos do servidor

- **Software:** Paper 1.26.2 (ou fork compatível)
- **Java:** 25 (o plugin `InfinityStones` e a Paper API 1.26.2 compilam para bytecode v69)
- **Vault + PlaceholderAPI** instalados (softdepend do `InfinityStones`/`BaltopPlugin`)

## Deploy

1. Descarrega/repo clone → copia `server/plugins/` para a pasta `plugins/` do servidor.
2. Mantém as **bases de dados** (`*.db`, `luckperms-h2-v2.mv.db`, `profiles.sqlite`, …) — **são versionadas de propósito**; sem elas perdem-se jogadores, homes e permissões.
3. Arranca o servidor e valida no console (sem erros de plugins) + testes-chave:
   `/getstone`, joias/manopla, crates, `/homes` + licenças, `/baltop`, `/shop`, login.

## Notas operacionais

- **Homes:** dono único é o `SurvivalProgression` (comandos homes desativados no `Essentials`).
- **Economia de kills:** `KillMoney` (recompensa/penalidade) — independente do sistema de bounties (SpruceBounty).
- Repositório **privado**: contém dados de jogadores (UUIDs, coordenadas). Não tornar público sem sanitizar.