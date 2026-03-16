#!/bin/bash
# Injecte un rappel de contexte au démarrage (global — fonctionne depuis n'importe quel projet)
MODE="${1:-startup}"

PROJECT_ROOT=$(git rev-parse --show-toplevel 2>/dev/null || pwd)
CLAUDE_MD="$PROJECT_ROOT/CLAUDE.md"
MEMORY_DIR="$PROJECT_ROOT/.memory"

# Compte les lignes du CLAUDE.md projet (pas global)
LINES=0
if [ -f "$CLAUDE_MD" ]; then
  LINES=$(wc -l < "$CLAUDE_MD" 2>/dev/null || echo "0")
fi

# Compte les lignes du CLAUDE.md global
GLOBAL_LINES=$(wc -l < ~/.claude/CLAUDE.md 2>/dev/null || echo "0")

case "$MODE" in
  startup)
    echo "📖 CLAUDE.md global chargé ($GLOBAL_LINES lignes)."
    if [ -f "$CLAUDE_MD" ]; then
      echo "📖 CLAUDE.md projet chargé ($LINES lignes). Consulte §3 (État) et §7 (Prochaines étapes)."
    fi
    if [ -d "$MEMORY_DIR" ]; then
      FILE_COUNT=$(ls "$MEMORY_DIR"/*.md 2>/dev/null | wc -l)
      echo "📂 Tier 2 disponible : $FILE_COUNT fichiers dans .memory/"
    fi
    ;;
  resume)
    echo "📖 Session reprise. CLAUDE.md = source de vérité."
    if [ -f "$CLAUDE_MD" ]; then
      echo "   Projet : $LINES lignes | Global : $GLOBAL_LINES lignes"
    fi
    ;;
  compact)
    echo "⚠️ Contexte compacté. CLAUDE.md rechargé depuis le disque."
    echo "📌 Rappel : tout ce qui n'est PAS dans CLAUDE.md ou .memory/ est PERDU."
    echo "📌 Si tu avais du contexte important en mémoire → /save-memory MAINTENANT."
    ;;
esac

exit 0
