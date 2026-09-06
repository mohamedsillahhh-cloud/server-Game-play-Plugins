# Configuração — Permissões e TAB (LuckPerms + TAB)

> Atualizado: 2026-09-06

## LuckPerms 5.5.0
- Storage: **H2** (`LuckPerms/luckperms-h2-v2.mv.db`, recriado em ~90KB pós-wipe → só estrutura inicial).
- `server: global` (servidor único).
- Config essencialmente default. Contagens/pesos não definidos no config → definidos em runtime (grupos apagados pelo wipe!).

### ⚠️ Impacto do wipe
- `WIPE-LEIA-ME.txt` removeu `LuckPerms/*.h2.mv.db` → **todos os grupos e permissões foram apagados**.
- Para voltar a funcionar com o expected stack, é preciso recriar **pelo menos**: `owner`, `admin`, `mod`, `helper`, `builder`, `vip`, `default` (ordem usada pelo TAB) e o prefixo/sufixo que o TAB lê (`%luckperms-prefix%`).

## TAB 6.1.0
Pasta: `TAB/` (config.yml, groups.yml, users.yml (minúsculo), messages.yml).

### Header/Footer
- Ativo: nome do servidor **"Gameplay CV"**; dá boas-vindas, jogadores online, ping e memória. Locale `pt-BR`.

### Tablist
- `tablist-name-formatting: enabled`, com `%world%=disabledworld` como condição de desativação (mundo de teste).

### Scoreboard teams (nametags)
- Ordenação: `GROUPS:owner,admin,mod,helper,builder,vip,default` → depois A-Z por `%player%`.
- cores: `case-sensitive-sorting: true`; `invisible-nametags: false`.

### Playerlist objective
- Tipo INTEGER com ping como valor; título "Gameplay CV".

### Scoreboard
- `enabled: true`, comando de toggle `/sb`, título `&6&lGAMEPLAY CV`.
- Linhas: dinheiro (`$%vault_eco_balance_formatted%`), kills (`%statistic_player_kills%`), mortes (`%statistic_deaths%`).

### Bossbar / Belowname / Layout / Comuns
- `bossbar.enabled: false`, `belowname.enabled: false`, `layout.enabled: false` (config default sobrevivente).
- `mysql.enabled: false`.
- **Proxy support:** `enabled: true`, tipo `PLUGIN`, nome `RedisBungee` → **sem evidência de proxy**; provável resquício (PROBLEMAS/).

### groups.yml
- Grupos custom: `Player` (prefixo/suffixo simples) + `_DEFAULT_` que usa `%luckperms-prefix%`/`%luckperms-suffix%`.
- Nota: os ranks previstos pelo SurvivalProgression (AVENTUREIRO etc.) **não constam** deste groups.yml — o TAB vem default/básico; só `Player` está definido explicitamente. (Pode ser intencional: lucraria pelo LuckPerms.)

### users.yml
- Praticamente vazio (nenhum utilizador fixo definido).