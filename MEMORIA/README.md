# MEMORIA DO PROJETO — SERVER PLUGINS

Memória permanente do projeto **SERVER PLUGINS** (datapack/pacote de plugins e configuração de um servidor Minecraft).

- **Data de criação da memória:** 2026-09-06
- **Auditoria inicial completa:** 2026-09-06
- **Localização do projeto real:** `C:\Users\silla\OneDrive\Projetos DEV\SERVER PLUGINS\download (12)\plugins`

## Como usar esta memória

1. Leia primeiro o [ESTADO_ATUAL.md](ESTADO_ATUAL.md) para saber o que foi feito até agora.
2. Consulte [ARQUITETURA.md](ARQUITETURA.md) para entender o sistema como um todo.
3. Para configurar algo, siga as pastas de `CONFIGURACAO/`.
4. Para alterações / bugs, abra um item em `PROBLEMAS/` e registe a decisão em `DECISOES/`.
5. Ao fim de cada sessão de trabalho, registe o que aconteceu em `SESSOES/<data>.md`.

## Estrutura

| Pasta/Ficheiro | Conteúdo |
|---|---|
| `ESTADO_ATUAL.md` | Estado atual do servidor/projeto e pendências |
| `ARQUITETURA.md` | Visão geral do sistema e fluxo de dados |
| `CONFIGURACAO/` | Snapshots e notas das configurações de cada plugin |
| `DATABASE/` | Inventário dos ficheiros de base de dados |
| `DECISOES/` | Decisões tomadas e o seu porquê |
| `DISCORD/` | Notas relacionadas com Discord (se aplicável) |
| `FLUXOS/` | Fluxos de jogo e de operação (join, homes, shop, bounties, wipe…) |
| `FUNCIONALIDADES/` | Documentação funcional de cada sistema |
| `HISTORICO/` | IMPLEMENTACOES.md, REMOCOES.md, BREAKING_CHANGES.md |
| `PROBLEMAS/` | Problemas / incidentes conhecidos e respetivo estado |
| `SESSOES/` | Registo cronológico de sessões de trabalho |

## Regras de manutenção

- **Não inventar:** toda a informação aqui deve ter origem verificável no código/config do projeto.
- **Hierarquia da verdade:** código executado > configuração/BD real em uso > testes > esta memória > documentação antiga.
- **Quando a informação não pode ser comprovada**, usar `DESCONHECIDO` / `NÃO DETERMINADO` / `HISTÓRICO: NÃO DETERMINADO`.
- **Dados de jogadores (UUIDs, nomes, coordenadas de casas, inventários) NÃO entram aqui.** Apenas se descreve a estrutura.
- Sempre que algo mudar, atualizar ESTADO_ATUAL.md e criar/editar SESSOES/.