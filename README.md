# SERVER PLUGINS

Pack de plugins pronto a implementar para um servidor **Paper 1.26.2**.

## O que está aqui

| Pasta | Conteúdo |
|---|---|
| `server/plugins/` | O pack - jars + pastas de configuração por plugin + `MANIFEST.txt` (inclui `GrimAC-2.3.74.jar`) |
| `server/config-overrides/` | Configs PRONTAS a colar que vivem fora de `plugins/` (anti-xray do Paper) |
| `_backups/` | Backups pré-alteração (não versionado) |
| `MEMORIA/` | Documentação técnica do servidor (não versionado) |

## Requisitos do servidor

- **Software:** Paper 1.26.2 (ou fork compatível)
- **Java:** 25 (o plugin `InfinityStones` e a Paper API 1.26.2 compilam para bytecode v69)
- **Vault + PlaceholderAPI** instalados (softdepend do `InfinityStones`/`BaltopPlugin`)

## Deploy

1. Descarrega/repo clone → copia `server/plugins/` para a pasta `plugins/` do servidor.
2. Mantém as **bases de dados** (`*.db`, `luckperms-h2-v2.mv.db`, `profiles.sqlite`, …) — **são versionadas de propósito**; sem elas perdem-se jogadores, homes e permissões.
3. Aplica os templates de **anti-xray** de `server/config-overrides/antixray/` nos ficheiros `paper-world.yml`/`paper-world-defaults.yml` do servidor (ver `server/NOTAS/LEIA-ME-ANTICHEAT.txt`).
4. Arranca o servidor e valida no console (sem erros de plugins) + testes-chave:
   `/getstone`, joias/manopla, crates, `/homes` + licenças, `/baltop`, `/shop`, login.

## Anti-Cheat & Anti-Xray

- **GrimAC 2.3.74** (`server/plugins/GrimAC-2.3.74.jar`) - anti-cheat de movimento/combate/pacotes com config afinada em `server/plugins/GrimAC/`.
- **Tudo fica registado** em 3 locais ao mesmo tempo: console/server logs (`[Grim]`), base de dados sqlite (`/grim history <jogador>`) e **Discord** (embed via webhook configurado em `discord.yml`).
- Punição: aviso (`[alert]`) imediato para a staff + **kick só em níveis altos**, sempre com motivo.
- **Anti-Xray** nativo do Paper (engine 2): templates drop-in em `server/config-overrides/antixray/`.
- Notas completas para o admin em `server/NOTAS/LEIA-ME-ANTICHEAT.txt`.

## Notas operacionais

- **Homes:** dono único é o `SurvivalProgression` (comandos homes desativados no `Essentials`).
- **Economia de kills:** `KillMoney` (recompensa/penalidade) — independente do sistema de bounties (SpruceBounty).
- Repositório **privado**: contém dados de jogadores (UUIDs, coordenadas) e o **webhook do Discord**. Não tornar público sem sanitizar.