#!/bin/bash
# Après compaction : rappel de relire + push si nécessaire (global)
PROJECT_ROOT=$(git rev-parse --show-toplevel 2>/dev/null)

# Si pas dans un repo git, rien à faire
if [ -z "$PROJECT_ROOT" ]; then
  exit 0
fi

cd "$PROJECT_ROOT" || exit 0

# Push les commits locaux s'il y en a
CURRENT_BRANCH=$(git branch --show-current 2>/dev/null)
if [ -n "$CURRENT_BRANCH" ] && git rev-parse "origin/$CURRENT_BRANCH" >/dev/null 2>&1; then
    if git log --oneline "origin/$CURRENT_BRANCH..HEAD" 2>/dev/null | grep -q .; then
        git push 2>/dev/null && echo "✅ Mémoire pushée après compaction" || true
    fi
fi

echo "📌 Post-compact : CLAUDE.md est ta seule source de vérité maintenant."

exit 0
