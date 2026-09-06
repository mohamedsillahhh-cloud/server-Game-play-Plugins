# Configuração — Extras (Auth, Lojas, Skins, Voz, Infra)

> Atualizado: 2026-09-06

## LoginSecurity 3.3.1 (`LoginSecurity/`)
- **Registo obrigatório** (`register.required: true`), captcha/confirm off.
- Login: `max-tries: 5`, `username-match-exact: true`.
- Password: min 6 / max 32.
- `join.blindness: true`, `join.location: DEFAULT`.
- `session-timeout: 60` s, `login-timeout: 120` s, `login-message-delay: 10` s.
- `language: en_us`. Storage: **SQLite** (`LoginSecurity.db`, recriado).
- ⚠️ Após wipe, **todas as senhas/contas foram apagadas** — os jogadores terão de se re-registar.

## Shopkeepers 2.27.0 (`Shopkeepers/config.yml`)
- `max-shops-per-player: 10`; `max-shops-perm-options: 5,15,25`.
- **WorldGuard integration:** `require-world-guard-allow-shop-flag: true`, `register-world-guard-allow-shop-flag: true`.
- `enable-sign-shops: true`, `enable-sign-post-shops: true`, `enable-hanging-sign-shops: true`, `enable-citizen-shops: false`.
- `currency-item: emerald`, `high-currency-item: emerald_block`, `high-currency-value: 9`; `tax-rate: 0`.
- `protect-containers: true`, `prevent-item-movement: true`, `delete-shopkeeper-on-break-container: true`.
- `save-instantly: true`. `trade-log-storage: DISABLED`. `check-shop-interaction-result: false`.
- ⚠️ Lojas de jogadores foram apagadas pelo wipe.

## SkinsRestorer (`SkinsRestorer/`)
- `database.type: FILE`; comandos default; `skinChangeCooldown: 30`; resource-pack fix on; Android `disableOnJoinSkins: false`.

## voicechat 2.6.21 (`voicechat/voicechat-server.properties`)
- Porta **UDP 56898**; `max_voice_distance: 48`; whisper 24; codec VOIP.
- `enable_groups: true`, `allow_recording: true`, `force_voice_chat: false`; spectator off; `threaded_server_support: true`.

## ProtocolLib (`ProtocolLib/config.yml`)
- Updates notify mas sem download; `metrics: true`; background compiler on.

## PlaceholderAPI 2.12.3 (`PlaceholderAPI/config.yml`)
- `check_updates` on; `cloud_enabled: true`; expansão `vault` configurada (format k/M/B/T/Q).
- ⚠️ No mínimo **2 jars iguais** na pasta `plugins/` (PROBLEMAS/).

## bStats / spark
- bStats on; spark `backgroundProfiler: true`. Ver `stacking-performance.md`.

## BlueSlimeCore 2.9.9.529 (`BlueSlimeCore/config.yml`)
- Lib do CombatLogX; update-checker on; cache de linguagem on.