# Program — Inbox Management Autoresearch

Tu es un agent de recherche autonome. Ton objectif : améliorer itérativement les prompts qui alimentent le système de gestion des inbox de devlo.

---

## Contexte

**Stack technique :** n8n + Claude + HubSpot
**Repo cible :** `devlo-inbox`
**Ce que tu optimises :** Les prompts Claude qui analysent, classifient et routent les messages entrants.

**"MD" dans ce contexte** = Messages entrants liés aux prospects/clients — comprendre de quoi il s'agit, quel est leur niveau d'intérêt, quel signal d'achat ils contiennent.

---

## Ce que tu fais à chaque expérience

### Étape 1 — Setup
1. Lis ce fichier en entier
2. Lis `results.md` pour connaître les expériences passées et les learnings accumulés
3. Lis `eval.md` pour comprendre les critères d'évaluation

### Étape 2 — Hypothèse
Formule une hypothèse précise basée sur les résultats passés.
Exemple : "Le prompt actuel rate les signaux d'achat passifs (visites répétées, questions sur les prix). Si j'ajoute un critère explicite pour ce signal, le score d'intention devrait s'améliorer."

**Règle : une seule variable modifiée à la fois.**

### Étape 3 — Challenger
Crée une version modifiée du prompt (le "challenger") basée sur ton hypothèse.
Le baseline est la version actuelle dans `devlo-inbox`.

### Étape 4 — Évaluation
Lance l'éval sur le batch de messages de test défini dans `eval.md`.
Calcule le score du challenger. Compare avec le score du baseline (voir `results.md`).

### Étape 5 — Décision
- Si challenger > baseline : challenger devient le nouveau baseline. Met à jour le prompt dans `devlo-inbox`.
- Si challenger <= baseline : rejette le challenger. Note pourquoi.

### Étape 6 — Log
Mets à jour `results.md` avec :
- Numéro d'expérience
- Hypothèse testée
- Score baseline vs challenger
- Decision (gardé / rejeté)
- Learning clé pour les prochaines expériences

### Étape 7 — Recommence
Formule une nouvelle hypothèse et relance.

---

## Objectifs du prompt à optimiser

Le prompt de classification doit permettre de :

1. **Comprendre l'intention** du message (demande d'info, achat imminent, curieux, pas intéressé, client actif, etc.)
2. **Détecter les signaux d'achat** : mots-clés de décision, urgence exprimée, budget mentionné, comparaison avec concurrents
3. **Router correctement** : vers quel workflow n8n ou quel commercial ce message doit-il aller ?
4. **Extraire les données clés** : nom, entreprise, besoin exprimé, timeline, budget si mentionné

---

## Contraintes

- Ne jamais modifier `eval.md` ou les messages de test
- Toujours committer `results.md` après chaque expérience
- Garder les prompts en français (contexte B2B francophone)
- Les changements dans `devlo-inbox` doivent être sur une branche `autoresearch/exp-[numero]`

---

## Métriques cibles

| Métrique | Baseline cible | Objectif |
|----------|---------------|---------|
| Score classification (sur 10) | ≥ 6/10 | ≥ 8.5/10 |
| Détection signaux d'achat | ≥ 50% | ≥ 80% |
| Précision routing | ≥ 60% | ≥ 90% |

---

## Note sur le contexte devlo

devlo est une agence B2B qui vend des systèmes AI à des entreprises. Les messages entrants sont typiquement :
- Des demandes de démo suite à du contenu LinkedIn/newsletter
- Des réponses à des séquences de prospection outbound
- Des questions de prospects chauds sur les prix ou les délais
- Des signaux passifs (visites répétées du site, réouvertures d'emails)

Un "signal d'achat fort" pour devlo = quelqu'un qui mentionne un budget, une deadline, ou qui compare activement des solutions.
