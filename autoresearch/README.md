# Autoresearch — alldevlo

Inspiré de [Karpathy/autoresearch](https://github.com/karpathy/autoresearch). Le principe : un agent AI modifie des prompts ou du code, mesure si le résultat s'est amélioré, garde ou rejette, et recommence. Tu te réveilles le matin avec un log d'expériences et (normalement) un système meilleur.

---

## Architecture

```
.github/autoresearch/       ← CE REPO — cerveau central
├── inbox-management/       ← programme + évals + résultats (inbox)
└── prospecting-sequences/  ← programme + évals + résultats (prospection)

devlo-inbox/                ← CODE RÉEL (l'équivalent du train.py)
    Les prompts n8n + Claude que l'agent modifie lors des expériences.

devlo-customers-db/         ← DONNÉES
    Signaux d'achat, historique clients, contexte prospect.
```

**Règle d'or :** Ce repo stocke la connaissance accumulée. Le code qui tourne vraiment vit dans les autres repos.

---

## Les 3 ingrédients (selon Karpathy)

| Ingrédient | Inbox Management | Prospecting Sequences |
|------------|-----------------|----------------------|
| **Métrique objective** | Score de classification (% emails correctement catégorisés) | Taux de réponse positif |
| **Outil de mesure** | Eval sur batch d'emails de test | API du CRM / outil d'envoi |
| **Ce qu'on modifie** | Prompts Claude dans n8n | Copy des séquences |

---

## Boucle d'expérimentation

```
1. Lire program.md (instructions agent)
2. Lire results.md (historique des expériences)
3. Formuler une hypothèse basée sur les learnings passés
4. Modifier le prompt ou le copy (challenger)
5. Mesurer avec eval.md
6. Comparer challenger vs baseline
7. Garder le winner, mettre à jour results.md
8. Recommencer
```

---

## Priorités

### P1 — Inbox Management (Devlo-Inbox)
Automatiser la compréhension des messages entrants (classification, contexte, routing).
Bonus : détecter les signaux d'achat pour alimenter les séquences de prospection.
→ Voir `inbox-management/`

### P2 — Séquences de Prospection
Optimiser le copy des séquences outbound sur la base des signaux d'achat détectés.
→ Voir `prospecting-sequences/`

---

## Comment lancer une session autoresearch

```
1. Ouvre ce repo dans Claude Code
2. Dis : "Lis autoresearch/[dossier]/program.md et lance une nouvelle expérience"
3. L'agent prend la suite de façon autonome
```

Pour une boucle autonome sur GitHub Actions, copie le template `.github/workflows/autoresearch-template.yml` dans le repo cible et configure les secrets API.

---

## Règles de bonne hygiène

- **Ne jamais modifier `eval.md` en cours d'expérience** — les critères doivent rester stables pour que les résultats soient comparables.
- **Toujours committer `results.md` après chaque expérience** — c'est la mémoire du système.
- **Garder les hypothèses courtes et testables** — une seule variable à la fois.
- **Ne pas fusionner des learnings de contextes différents** — inbox ≠ prospecting.
