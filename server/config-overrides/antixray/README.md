# Anti-Xray — templates drop-in (Paper 1.26.2)

Proteção contra Xray nativa do Paper (obfuscation-based, sem plugin extra). O
pack é entregue a pensar em `server/plugins/`, mas o Anti-Xray vive na config do
servidor — por isso aqui estão os blocos prontos a colar.

## Ficheiros do servidor a editar (localização em `config/`)

| Mundo  | Ficheiro                                                    | Usa |
|---|---|---|
| Overworld | `config/paper-world-defaults.yml`                            | `01-world-defaults-antixray.yml` |
| Nether    | `config/world/dimensions/minecraft/the_nether/paper-world.yml` | `02-nether-antixray.yml` |
| End       | `config/world/dimensions/minecraft/the_end/paper-world.yml`    | `03-end-antixray.yml` |

> Se o teu Paper usar o layout antigo, os `paper-world.yml` estão dentro da pasta
> de cada mundo (ex.: `world_the_nether/paper-world.yml`). O caminho do
> `paper-world-defaults.yml` é sempre `config/`.

## Como aplicar

1. Desliga o servidor completamente (não uses `/reload`).
2. Abre cada ficheiro acima e **substitui o bloco `anticheat.anti-xray:`** pelo
   conteúdo do template correspondente. (Sem blocos existentes? Cola o template
   e acrescenta o `anticheat:` na indentação correta.) **Respeita os espaços** —
   YAML não aceita tabs.
3. Guarda, liga o servidor.
4. Valida com timings/spark, ou simplesmente testa com um resource pack/texture
   de xray: os minérios devem aparecer como pedra falsa.

## Decisões

- **engine-mode: 2** — substitui `hidden-blocks` E `replacement-blocks` por
  minérios falsos aleatórios. Melhor relação proteção/CPU.
- **`air` NÃO está na lista** `hidden-blocks` (como a Paper sugere como opção):
  esconder ar esconde minérios expostos em cavernas, mas causa **quedas de FPS
  nos clientes**. Com `air` a menos, minérios expostos ao ar podem ver-se —
  vantagem dos minérios falsos é tapar a maioria.
- **max-block-height** sob medida por mundo (64 overworld / 128 nether).
- **End desligado** — quase sem recursos, não vale o CPU.

## Limitações (docs oficiais)

- Minérios acima de `max-block-height` não são escondidos.
- World seed reversível continua a ser um vetor (reduzível com seeds por mundo).
- Isto **bloqueia** xray; não "acusas" jogadores (para análise de padrões de
  mineração seria preciso uma camada heurística à parte).
- Alterações só aplicam com **restart**. Se "não funciona", a lista está
  desatualizada (minérios novos/caves) — mantém este ficheiro atualizado.

Ref: https://docs.papermc.io/paper/anti-xray/