#!/bin/bash
# Sauvegarde automatique en fin de session (global)
PROJECT_ROOT=$(git rev-parse --show-toplevel 2>/dev/null)
TIMESTAMP=$(date +%Y-%m-%d-%H%M)

# Si pas dans un repo git, rien à faire
if [ -z "$PROJECT_ROOT" ]; then
  exit 0
fi

cd "$PROJECT_ROOT" || exit 0

CHANGED=false
git diff --quiet CLAUDE.md 2>/dev/null || CHANGED=true
git diff --quiet .memory/ 2>/dev/null || CHANGED=true

if [ "$CHANGED" = true ]; then
    git add CLAUDE.md .memory/ 2>/dev/null
    git commit -m "memory(session-end): $TIMESTAMP" --no-verify 2>/dev/null
    git push 2>/dev/null && echo "✅ Mémoire sauvegardée et pushée (fin de session)" || \
        echo "⚠️ Mémoire commitée mais push échoué"
fi

exit 0
