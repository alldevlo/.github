#!/bin/bash
# Sauvegarde automatique AVANT compaction (global — fonctionne depuis n'importe quel projet)
PROJECT_ROOT=$(git rev-parse --show-toplevel 2>/dev/null)
TIMESTAMP=$(date +%Y-%m-%d-%H%M)

# Si pas dans un repo git, rien à faire
if [ -z "$PROJECT_ROOT" ]; then
  exit 0
fi

cd "$PROJECT_ROOT" || exit 0

# Vérifier s'il y a des changements sur CLAUDE.md ou .memory/
CHANGED=false
git diff --quiet CLAUDE.md 2>/dev/null || CHANGED=true
git diff --quiet .memory/ 2>/dev/null || CHANGED=true
git diff --cached --quiet CLAUDE.md 2>/dev/null || CHANGED=true
git diff --cached --quiet .memory/ 2>/dev/null || CHANGED=true

if [ "$CHANGED" = true ]; then
    git add CLAUDE.md .memory/ 2>/dev/null
    git commit -m "memory(pre-compact): sauvegarde auto — $TIMESTAMP" --no-verify 2>/dev/null
    echo "✅ Mémoire commitée avant compaction ($TIMESTAMP)"
else
    echo "✅ Mémoire déjà à jour avant compaction"
fi

exit 0
