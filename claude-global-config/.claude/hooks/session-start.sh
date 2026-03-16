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

# --- Vérification de l'architecture mémoire v3 ---
EXPECTED_FILES="decisions.md architecture.md gotchas.md conventions.md context.md progress.md"
MISSING_FILES=""
MISSING_DIRS=""
AUDIT_NEEDED=false

if [ ! -f "$CLAUDE_MD" ]; then
  AUDIT_NEEDED=true
  MISSING_FILES="CLAUDE.md"
fi

if [ ! -d "$MEMORY_DIR" ]; then
  AUDIT_NEEDED=true
  MISSING_DIRS=".memory/"
else
  for f in $EXPECTED_FILES; do
    if [ ! -f "$MEMORY_DIR/$f" ]; then
      MISSING_FILES="${MISSING_FILES:+$MISSING_FILES, }.memory/$f"
      AUDIT_NEEDED=true
    fi
  done
  if [ ! -d "$MEMORY_DIR/archive" ]; then
    MISSING_DIRS="${MISSING_DIRS:+$MISSING_DIRS, }.memory/archive/"
    AUDIT_NEEDED=true
  fi
fi

# --- Affichage selon le mode ---
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

    # Audit architecture
    if [ "$AUDIT_NEEDED" = true ]; then
      echo ""
      echo "⚠️ AUDIT MÉMOIRE — Architecture incomplète détectée dans ce projet :"
      [ -n "$MISSING_DIRS" ] && echo "   Dossiers manquants : $MISSING_DIRS"
      [ -n "$MISSING_FILES" ] && echo "   Fichiers manquants : $MISSING_FILES"
      echo ""
      echo "📋 ACTION REQUISE : Propose à l'utilisateur d'initialiser le système mémoire v3 pour ce projet."
      echo "   → Créer CLAUDE.md (template §F) si absent"
      echo "   → Créer .memory/ avec les 6 fichiers Tier 2 (decisions, architecture, gotchas, conventions, context, progress)"
      echo "   → Créer .memory/archive/"
      echo "   → Utiliser /save-memory pour la première sauvegarde"
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
