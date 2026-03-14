# Eval — Inbox Management

Ces critères sont FIXES. Ne pas modifier pendant une série d'expériences.
Toute modification de `eval.md` réinitialise la série (les résultats précédents ne sont plus comparables).

---

## Format d'évaluation

Pour chaque message de test, réponds par OUI ou NON à chaque critère.
Score final = (nombre de OUI) / (nombre total de critères × nombre de messages).

---

## Les 5 critères (binaires)

### C1 — Intention identifiée correctement
Le prompt a-t-il correctement identifié l'intention principale du message ?
(achat imminent / curiosité / demande d'info / pas intéressé / client actif / autre)
→ OUI si la catégorie attribuée correspond à la catégorie attendue dans le batch de test.

### C2 — Signal d'achat détecté (si présent)
Si le message contient un signal d'achat (budget, deadline, comparaison, urgence), le prompt l'a-t-il identifié ?
→ OUI si détecté. OUI automatiquement si aucun signal présent dans le message.

### C3 — Routing correct
Le prompt a-t-il recommandé le bon workflow ou le bon interlocuteur ?
→ OUI si le routing correspond à la décision attendue dans le batch.

### C4 — Données clés extraites
Le prompt a-t-il extrait correctement : nom/entreprise (si présent), besoin exprimé, et timeline (si mentionnée) ?
→ OUI si au moins 2 des 3 champs présents dans le message sont correctement extraits.

### C5 — Pas de faux positif d'urgence
Le prompt n'a-t-il PAS marqué comme "urgent" ou "achat imminent" un message qui ne l'est clairement pas ?
→ OUI si pas de faux positif.

---

## Batch de messages de test

> **Note :** Ce batch doit être créé lors de la première expérience. L'agent doit générer 10 messages fictifs représentatifs du contexte devlo (voir `program.md`), couvrant les différents types d'intentions, et définir la réponse attendue pour chacun. Ce batch ne change pas ensuite.

Le batch de test est stocké dans `test-batch.json` (à créer lors de l'expérience 1).

Format attendu :
```json
[
  {
    "id": 1,
    "message": "Bonjour, j'ai vu votre article sur LinkedIn sur l'automatisation des process RH. Est-ce que vous faites aussi ce type de projet ?",
    "expected_intent": "curiosite",
    "expected_buying_signal": false,
    "expected_routing": "newsletter_followup",
    "expected_urgency": false
  }
]
```

---

## Score minimum pour considérer une amélioration

- Score challenger > Score baseline + **0.05** (5 points de pourcentage)
- En cas d'égalité ou amélioration < 5%, garder le baseline (principe de parcimonie)

---

## Calcul du score

```
Score = Σ(OUI pour chaque critère sur chaque message) / (5 critères × 10 messages)
Score max = 1.0 (100%)
```

Exemple : 42 OUI sur 50 possibles = score de 0.84 (84%)
