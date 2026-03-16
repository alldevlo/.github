<!-- MEMORY SYSTEM v3 — GLOBAL CONFIG
PROTOCOLE :
- Ce fichier = Tier 1 GLOBAL (toujours chargé, ≤ 200 lignes)
- .memory/*.md = Tier 2 PER-PROJECT (chargé à la demande)
- Survit à /compact (relu depuis le disque)
- Mis à jour EN TEMPS RÉEL pendant la session
- /save-memory = routine d'archiviste complète

TRIGGERS DE MISE À JOUR IMMÉDIATE :
- Décision prise → §5 (+ Tier 2 si détaillée)
- État changé → §3
- Piège découvert → §6
- Objectif atteint → §2

TRIGGERS DE SAUVEGARDE COMPLÈTE :
- "Push to GitHub et sauve ta mémoire"
- "/save-memory"
- Compaction auto/manuelle (via hook)
- Fin de session (via hook)
-->

# Mémoire Globale — Claude Code

## §1. Vision
<!-- 2-3 phrases max. L'étoile polaire. -->

## §2. Objectifs
<!-- ✅ = fait. Max 10 items. Archiver mensuellement dans .memory/progress.md -->
- [ ]

## §3. État courant
<!-- ⚡ MIS À JOUR À CHAQUE SESSION -->
**Date :** 2026-03-16
**Phase :**
**En cours :**
**Bloqué par :**
**Contexte :**

## §4. Stack & Architecture
<!-- Liste concise. Détails → .memory/architecture.md -->

## §5. Décisions récentes
<!-- 5-10 dernières. Format : YYYY-MM-DD | décision | pourquoi -->
<!-- Historique complet → .memory/decisions.md -->
| Date | Quoi | Pourquoi |
|------|------|----------|
|      |      |          |

## §6. Gotchas actifs
<!-- Pièges ACTUELS seulement. Résolus → .memory/gotchas.md -->

## §7. Prochaines étapes
<!-- Top 5. Ordonné par priorité. -->
1.

## §8. Mémoire Tier 2
<!-- Pointeurs vers les fichiers de détail (per-project, à la racine du projet) -->
- `.memory/decisions.md` — Historique complet des décisions
- `.memory/architecture.md` — Architecture détaillée, diagrammes
- `.memory/gotchas.md` — Tous les pièges (actifs + résolus)
- `.memory/conventions.md` — Standards de code, nommage, patterns
- `.memory/context.md` — Règles métier, contraintes, personnes
- `.memory/progress.md` — Objectifs archivés, milestones passés

## §9. Règles mémoire
1. Ce fichier ≤ 200 lignes
2. Mis à jour en temps réel, pas en fin de session
3. `/save-memory` = archiviste complet (compresse + restructure + push)
4. Ce qui n'est pas ici ou dans .memory/ est PERDU après compaction
5. Détails → Tier 2. Résumés → Tier 1. Historique → claude-mem (Tier 3)
