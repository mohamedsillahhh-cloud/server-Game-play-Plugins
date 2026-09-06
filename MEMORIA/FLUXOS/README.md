# FLUXOS — Fluxos de Jogo e de Operação

> Atualizado: 2026-09-06

## 1. Entrar no servidor (join)
```
Player junta-se
  → LoginSecurity: registo obrigatório (senha min 6) / login (max 5 tentativas), session 60s
  → Essencialmente acesso bloqueado até autenticar (blindness quando não logado)
  → LuckPerms: carrega grupos/perms (recriar grupos!)
  → Spawn: `spawn-on-join: true` → teletransporta p/ spawn (mundo `world`)
  → TAB: header/footer/scoreboard "Gameplay CV"; prefixo pelo LuckPerms
```

## 2. Homes (SurvivalProgression)
```
/sethome <nome>  → guarda em data.yml (limite por licença: base + HOME_6..10)
/home /homes     → GUI/teleporte (delay `teleport-delay: 5`s)
/delhome <nome>  → remove
```
- O SurvivalProgression sobrepõe os comandos do Essentials.
- Importação do HomesPanel já feita (`homes-imported: true`).

## 3. Comprar licenças / avançar rank
```
/progress (alias progresso/rank/licencas)
  → GUI mostra ranks (AVENTUREIRO→LENDARIO) e licenças
  → Pagamento via Vault/EssentialsX; critérios (horas/kills/mobs/blocos) avaliados
  → Ao comprar SPAWNER_I..IV: habilita spawners; EC_REMOTE/EC_36/45/54, CRAFT, ARSENAL.
```

## 4. Loja (CommunityShop + interceção)
```
/shop (aberto por SurvivalProgression — `shop-command-intercept: true`)
  → mostra categorias (17); itens com stock/preço dinâmico (prices/stock)
  → spawner de categoria `spawnerek` só visível/comprado se licença SPAWNER
/sell → venda em massa (GUI)
/shopreload · /shopstock · /shopprice (admin)
```

## 5. Bounty (SpruceBounty)
```
/bounty set <alvo> <montante>  → debita do remetente (min/max config)
/bounty list | check | top | cancel
/bountyadmin remove|clear|reload (admin)
Quando o alvo morre por um jogador: quem matou recebe o montante + broadcast em PT
```

## 6. Combate / logout
```
PvP (permitido fora do spawn)
  → CombatLogX marca 20s (tag global); morrer em combate NÃO desmarca (untag-on-death)
  → Logout em combate → kill imediato (`kill-time: QUIT`)
  → PlayerHeadDrops: morte PvP → drop da cabeça (100%) + anúncio
  → KillMoney: o matador recebe pagamento por kill
  → RichReveal: revela a posição do mais rico de tempos a tempos
```

## 7. Joias (InfinityStones)
```
/stonecrate → compra crate (500.000$) → sorteio animado (pesos iguais) → 1 das 6 Joias + "all"
Equip no /gauntlet (slots fixos) → habilidades por pedra (beam, speed, double-jump, teleport…)
```
> ⚠️ Mensagem diz "100.000$" mas config pede 500.000$ (PROBLEMAS/).

## 8. Wipe total (manual)
```
Executar passos de WIPE-LEIA-ME.txt:
  → remove ficheiros de dados (usuários, homes legacy, BDs, stocks, regiões, senhas…)
  → mantém jars e configs (com exceções documentadas no TXT)
  → no próximo arranque os plugins recriam os ficheiros vazios
```
> Pós-wipe: **recriar LuckPerms (grupos/prefixos)**, verificar região `spawn` do WorldGuard e stocks do CommunityShop antes de abrir ao público.

## 9. Manutenção diária
```
/lp log minutely · /clx forgive … · /spark (perf e profiling)
Atualizar SESSOES/ quando houver trabalho.
```