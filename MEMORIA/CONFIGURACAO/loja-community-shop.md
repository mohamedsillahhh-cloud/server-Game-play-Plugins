# Configuração — Loja Comunitária (loerx-communityshop 1.2-FIXED)

> Atualizado: 2026-09-06 · Pasta: `loerx-communityshop/`

## Ficheiros

| Ficheiro | Papel |
|---|---|
| `config.yml` (≈5214 linhas) | categorias, slots, materiais, nomes, configuração geral |
| `prices.yml` | preços de compra/venda (dinâmicos, geridos por oferta/procura) |
| `stock.yml` | stock de cada item |
| `slots.yml` | posições dos itens nas categorias (com `slots.yml.backup-original`) |
| `templates.yml` | mapas `spawnerek_<mob>-spawner-entity` → tipo de entidade (para spawners) |
| `custom_shops.yml` | **vazio** — nenhuma loja custom criada |
| `lang_en.yml` | mensagens (idioma `en`, prefix `&8[&6CommunityShop&8] &r`) |

## Configuração global (config.yml)
- `language: en`.
- GUI: `category-back-slot: 49`, `border-material: BLACK_STAINED_GLASS_PANE`.
- **Categorias (17):** `blocks`, `wood`, `ores`, `farming`, `mob_drops`, `food`, `dyes`, `utility_redstone`, `tools_weapons`, `armor`, `enchanting_potions`, `transportation`, `rare`, `colored_blocks`, `decoration`, `chaos_cubed_26_2`, `spawnerek`.
  - `spawnerek` = categoria de spawners (gerida/limitada pelo SurvivalProgression — ver `progressao.md`).

## Comandos
- `/shop` (abre), `/sell` (venda em massa por GUI), `/shopreload`, `/shopstock`, `/shopedit`, `/shopprice`, `/shopmode`, `/shoplang`, `/shopmove`, `/shopdelete`, `/shopcategory`, `/shophelp`, `/shopcurrencymotor`, `/shopcurrency`, `/shopdebug`, `/shopcreate`, `/shopadmin`.
- Permissões: `communityshop.use` / `communityshop.sell` (default true) · `communityshop.admin` (op).

## Modo de funcionamento
- **Supply-driven:** o stock de cada item é consumido nas compras e reposto nas vendas; `prices.yml`/`stock.yml` são ajustados dinamicamente (preços sobem com baixo stock, descem com alto).
- Suporta 2 motores de economia: **Vault** (usado aqui) ou `loerx-currency` (ausente). `shopcurrencymotor` permite trocar.
- Pós-wipe os ficheiros prices/stock/slots foram **recriados** (defaults descarregados do plugin ou regenerados) — validar valores em runtime antes de abrir ao público.

## Notas
- Nomes/acentos de algumas strings podem estar mal codificados (UTF-8) — ver PROBLEMAS/.
- O SurvivalProgression intercepta `/shop` para esconder spawners sem licença.