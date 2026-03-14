# PROMPT POUR CLAUDE CODE DANS CURSOR

> **Instructions** : Ouvre Cursor dans le dossier parent GitHub (~/Documents/GitHub/).
> Ouvre Claude Code (terminal). Copie-colle TOUT ce qui suit en un seul message.

---

## CONTEXTE COMPLET

Tu es un développeur IT senior avec 15 ans d'expérience. Tu travailles pour **alldevlo**, une agence B2B qui vend des systèmes AI de prospection, inbox management et onboarding client.

Tu as accès à TOUS les repos alldevlo dans le dossier courant. Voici les repos pertinents :
- `aios-devlo/` — AI Operating System de devlo (contexte business, prompts, intelligence)
- `devlo-inbox/` — Inbox automation (n8n + Claude + HubSpot)
- `devlo-clay/` ou `devlo-clay/` — Signaux d'achat Clay pour la prospection
- `devlo-customers-db/` — Pipeline de connaissance client (Supabase)
- `expert-brains/` — Base de connaissances experts pour agents AI
- `.github/` — Repo organisation (contient déjà un framework autoresearch en brouillon)

---

## LE PROCESSUS COMPLET DE L'AGENCE DEVLO (étapes 1 à 9)

Voici le flux end-to-end de l'agence. Tu dois comprendre chaque étape pour bien positionner l'autoresearch :

1. **Signature du contrat** avec le client
2. **Envoi des accès du portail** au client (admin portal)
3. **Le client complète le portail** à la main : informations, documents. Exemple de portail : voir le repo `mobatime-with-devlo` si disponible. Ensuite, on complète le portail avec les infos du transcript d'appel
4. **Expert brains** : on va chercher les connaissances des experts de l'industrie du client (repo `expert-brains`). Ces brains aident à comprendre le marché du client
5. **Identification des signaux d'achat** : sur base des expert brains + contexte client, on identifie les meilleurs signaux d'achat. Une fois validés par le client, on lance la suite via l'admin portal → on s'accorde sur la logique de la séquence de prospection. L'agent AI prépare des prompts pour ClayAgent dans Clay pour scraper les infos et générer les emails en cascade
6. **Synchronisation** : Clay → HubSpot + Lemlist. On envoie les emails et messages LinkedIn
7. **Réception des réponses** des prospects via LinkedIn et email
8. **Inbox management automatisé** (repo `devlo-inbox`) : processe les réponses négatives ET positives automatiquement
9. **Booking** : pour les réponses positives, on boucle un RDV dans le calendrier du client

---

## TES 3 MISSIONS

### MISSION 1 — Mettre à jour aios-devlo avec le processus complet

Lis le repo `aios-devlo/` en entier. Puis ajoute/mets à jour la documentation pour refléter le processus complet en 9 étapes décrit ci-dessus. Le AIOS doit être la source de vérité pour tout le fonctionnement de devlo.

### MISSION 2 — Autoresearch pour Inbox Management (PRIORITÉ #1)

**Contexte :**
- Le repo `devlo-inbox` contient l'automatisation inbox (n8n + Claude + HubSpot)
- Il y a des conversations historiques des dernières années DANS ce repo
- On lance le client **Bitsight** lundi ou mardi prochain
- On doit valider que l'inbox management automatisé est SOLIDE avant ce lancement
- On utilise les données historiques pour "entraîner" / valider le système

**Deux axes d'amélioration :**

**A) Validation immédiate (avant Bitsight) :**
- Utilise les conversations historiques stockées dans `devlo-inbox` comme dataset de test
- Évalue les prompts Claude actuels contre ces vraies conversations
- Mesure : est-ce que le système classifie correctement ? Détecte les signaux d'achat ? Route bien ?
- Critères d'éval (binaires OUI/NON) :
  - C1 : Intention du message correctement identifiée ?
  - C2 : Signal d'achat détecté (si présent) ?
  - C3 : Routing correct vers le bon workflow/commercial ?
  - C4 : Données clés extraites (nom, entreprise, besoin, timeline) ?
  - C5 : Pas de faux positif d'urgence ?

**B) Amélioration continue (après lancement) :**
- Le système s'améliore au fil du temps grâce au human-in-the-loop et feedback-in-the-loop déjà en place dans `devlo-inbox`
- Intégrer la boucle autoresearch de Karpathy : modifier prompt → tester → mesurer → garder ou rejeter → recommencer
- Chaque expérience est loggée avec hypothèse, score baseline vs challenger, et learning

### MISSION 3 — Autoresearch pour Séquences de Prospection (PRIORITÉ #2)

**Contexte :**
- Lis le repo des signaux Clay (probablement `devlo-clay` ou un nom similaire — cherche dans les dossiers disponibles)
- Comprends comment les signaux d'achat sont détectés et comment les séquences de prospection sont construites
- Deux métriques à optimiser :
  1. **Qualité des signaux détectés** : précision de la détection des signaux d'achat dans Clay
  2. **Taux de réponse positif** : % de prospects qui répondent positivement aux séquences

**Ce que tu dois faire :**
- Lis `devlo-clay` (ou équivalent) en profondeur
- Comprends la stratégie actuelle de signaux d'achat
- Propose la meilleure manière d'intégrer l'autoresearch dans ce workflow existant
- Ne crée rien encore — propose d'abord ta recommandation

---

## RÉFÉRENCE : CONCEPT AUTORESEARCH (Karpathy)

Inspiré de https://github.com/karpathy/autoresearch

Le principe :
1. Un agent AI modifie un élément (prompt, code, copy)
2. Il teste le résultat contre une métrique objective
3. Si c'est mieux → on garde (nouveau baseline)
4. Si c'est pareil ou pire → on rejette
5. On log le learning et on recommence
6. Le système s'améliore tout seul au fil du temps

Les 3 ingrédients nécessaires :
- **Métrique objective** : un nombre mesurable (pas du "feeling")
- **Outil de mesure** : automatisé, fiable, sans humain dans la boucle
- **Quelque chose à modifier** : le prompt, le copy, le code

---

## CE QUI A DÉJÀ ÉTÉ FAIT

Dans le repo `.github/` sur la branche `claude/setup-autoresearch-repo-P9JsO`, j'ai créé un brouillon du framework :
- `autoresearch/README.md` — Vue d'ensemble architecture
- `autoresearch/inbox-management/program.md` — Instructions agent (brouillon)
- `autoresearch/inbox-management/eval.md` — Critères d'éval (brouillon)
- `autoresearch/inbox-management/results.md` — Log d'expériences (vide)

**IMPORTANT** : Ce sont des brouillons créés SANS avoir lu les repos réels. Tu dois les adapter/réécrire en fonction de ce que tu trouves réellement dans `devlo-inbox`, `aios-devlo`, et le repo Clay.

---

## ORDRE D'EXÉCUTION

1. **D'abord, LIS** : Explore `aios-devlo/`, `devlo-inbox/`, et le repo Clay en profondeur. Comprends la structure, les prompts existants, les workflows, les données historiques.

2. **Ensuite, POSE DES QUESTIONS** : Si quelque chose n'est pas clair, demande avant de coder.

3. **Puis, PROPOSE** : Avant de modifier quoi que ce soit, présente ton plan :
   - Comment tu vas mettre à jour aios-devlo
   - Comment tu vas intégrer l'autoresearch dans devlo-inbox (en utilisant les vraies conversations historiques)
   - Ta recommandation pour l'autoresearch prospection
   - Dans quel(s) repo(s) chaque chose doit vivre

4. **Enfin, EXÉCUTE** : Une fois validé, implémente le tout.

---

## RÈGLES

- Travaille de manière propre : branches séparées, commits clairs
- Ne crée PAS de nouveau repo sauf si absolument nécessaire
- Garde tout en français (contexte B2B francophone)
- Ne perds aucun contexte — tout ce qui est écrit ici est important
- Priorise : Inbox Management d'abord (lancement Bitsight lundi/mardi)
