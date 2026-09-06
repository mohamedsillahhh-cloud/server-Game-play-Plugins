# DECISOES — Registo de Decisões

> Atualizado: 2026-09-06

Formato: cada decisão com **o quê**, **porquê**, **quando**, **estado**.

---

## D-001 — Wipe total do servidor (2026-09-0? · executado)
- **O quê:** remover todos os dados persistentes de jogadores (economia, perms, homes, regiões, lojas, senhas, bounties, stocks) mantendo jars e configs.
- **Porquê:** início de temporada/detecção de itens duplicados/start limpo (motivo exato: **HISTÓRICO: NÃO DETERMINADO** — o ficheiro `WIPE-LEIA-ME.txt` descreve o processo, não o motivo).
- **Ficheiro fonte:** `WIPE-LEIA-ME.txt` (lista do que é limpo vs mantido).
- **Estado:** ✅ executado (BDs recriadas vazias; configs preservadas).

## D-002 — Substituir HomesPanel pelo SurvivalProgression (2026-09-0x)
- **O quê:** desativar `HomesPanel-1.0.0.jar` (ficheiro `.disabled`) e passar homes para o **SurvivalProgression** (que importa `homes.yml` → `data.yml`, `homes-imported: true`).
- **Porquê:** unificar homes + progressão num só sistema com licenças (HOME_6…HOME_10).
- **Evidência:** `LEIA-ME-SURVIVALPROGRESSION.txt`; `data.yml` com `homes-imported: true`.
- **Estado:** ✅ executado.

## D-003 — Shop patcheado do CommunityShop (loerx-communityshop 1.2-FIXED)
- **O quê:** usar build "FIXED" do `loerx-communityshop` e substituir configs do shop pelos de `patched/loerx-communityshop/`.
- **Porquê:** corrigir comportamento do shop (provavelmente a venda de spawners e/ou lógica de stock).
- **Evidência:** `LEIA-ME-SURVIVALPROGRESSION.txt`; jar `loerx-communityshop-1.2-FIXED.jar`.
- **Estado:** ✅ executado (configs atuais correspondem ao patched).

## D-004 — Vendores de spawners controlados pela progressão
- **O quê:** o `/shop` (CommunityShop) deixa de vender livremente todos os spawners; o SurvivalProgression intercepta o comando e liberta spawners por **licença SPAWNER_I–IV**.
- **Porquê:** ligar a venda de spawners ao sistema de progressão/cores (economia equilibrada).
- **Evidência:** `SHOP-COMMAND-INTERCEPT=true` no config do SurvivalProgression + templates `spawnerek_*` no CommunityShop.
- **Estado:** configurado; comportamento em runtime a validar.

## D-005 — Manter `HomesPanel-1.0.0.jar.disabled` (não apagar jar)
- **O quê:** ao desativar o HomesPanel, **manter** o jar renomeado para `.disabled` (e os dados) em vez de apagar.
- **Porquê:** conservar dados de homes até a migração ser confirmada (importação `homes-imported: true` já feita).
- **Estado:** ✅ aplicado (ficheiro `.disabled` presente).

---

## Notas
- Decisões anteriores à 1.ª auditoria (motivo do wipe, ordem de criação dos plugins custom) → `HISTÓRICO/HISTÓRICO: NÃO DETERMINADO` salvo se evidenciado nos ficheiros TXT.
- Nova decisão → adicionar aqui com data + sessão em SESSOES/.