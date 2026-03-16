---
description: "Sauvegarde ta mémoire : compresse, restructure, archive, push."
---

# ROUTINE D'ARCHIVISTE — Sauvegarde mémoire

Tu vas effectuer une sauvegarde complète de ta mémoire projet.
Suis ces étapes dans l'ordre. Ne saute aucune étape.

## Phase 1 — Inventaire

1. `cat CLAUDE.md` — relis le Tier 1 intégralement
2. `ls .memory/` — vérifie l'existence du Tier 2
3. Fais l'inventaire mental de TOUT ce que tu as appris cette session :
   - Décisions prises (type: decision)
   - Changements d'architecture (type: architecture)
   - Pièges découverts ou résolus (type: gotcha)
   - Progrès réalisés (type: progress)
   - Contexte métier clarifié (type: context)
   - Conventions établies (type: convention)

## Phase 2 — Compression (principe claude-mem)

Pour chaque information identifiée, applique le test de compression :

> "Si je démarrais une session fraîche demain, est-ce que cette info
> est ESSENTIELLE pour reprendre sans perte ni confusion ?"

- OUI + critique → Tier 1 (CLAUDE.md)
- OUI + détaillé → Tier 2 (.memory/[type].md)
- NON → Ne pas stocker (le chat suffit, ou claude-mem le capture)

## Phase 3 — Mise à jour Tier 1 (CLAUDE.md ≤ 200 lignes)

Met à jour CLAUDE.md avec UNIQUEMENT ce qui doit être chargé à chaque session :

- §1 Vision : jamais plus de 3 lignes
- §2 Sous-objectifs : liste à puces cochables, max 10 items
- §3 État courant : TOUJOURS mettre à jour (date + 4-5 lignes max)
- §4 Stack : liste concise, pas de prose
- §5 Décisions récentes : les 5-10 dernières SEULEMENT (les anciennes → Tier 2)
- §6 Gotchas actifs : pièges ACTUELS, pas historiques
- §7 Prochaines étapes : top 5 maximum, ordonnées
- §8 Pointeurs Tier 2 : liens vers les fichiers .memory/ pour le détail

Compte les lignes après mise à jour. Si > 200 → compresser davantage.
Si > 300 → c'est un échec, refaire la Phase 2.

## Phase 4 — Mise à jour Tier 2 (.memory/)

Archive et structure les détails dans les fichiers appropriés :

```bash
# Créer les fichiers s'ils n'existent pas
mkdir -p .memory/archive
touch .memory/decisions.md .memory/architecture.md \
      .memory/gotchas.md .memory/conventions.md \
      .memory/context.md .memory/progress.md
```

Pour chaque fichier Tier 2 :
- Ajouter les nouvelles entrées horodatées
- Supprimer les entrées devenues obsolètes
- Garder l'ordre anti-chronologique (récent en haut)
- Si un fichier > 200 lignes → archiver l'ancien dans .memory/archive/YYYY-MM-[type].md

## Phase 5 — Nettoyage (anti context-rot)

- Parcours chaque section de CLAUDE.md : est-ce encore vrai ?
- Supprime les doublons entre Tier 1 et Tier 2
- Vérifie que les pointeurs §8 sont corrects
- Assure-toi qu'il n'y a AUCUNE information sensible (clés API, mots de passe)

## Phase 6 — Diff visible

Affiche :
```
📝 Mémoire sauvegardée :
CLAUDE.md : [X] lignes ([delta] vs avant)
- §3 État : [résumé changement]
- §5 +N décision(s)
- §7 Prochaines étapes : réordonné

.memory/ :
- decisions.md : +N entrées
- gotchas.md : +N, -N obsolètes
- [autres changements]
```

## Phase 7 — Commit & Push

```bash
git add CLAUDE.md .memory/
git commit -m "memory: $(date +%Y-%m-%d) — [résumé 1 ligne du delta principal]"
git push
```

## Phase 8 — Confirmation

Résumé en 3 lignes max pour la prochaine session :
1. Où on en est
2. Ce qui a changé
3. Quelle est la prochaine priorité
