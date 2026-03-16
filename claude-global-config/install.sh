#!/bin/bash
# install.sh — Installe le système mémoire v3 au niveau global (~/.claude/)
# Usage : bash install.sh

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="$HOME/.claude"

echo "🧠 Installation du système mémoire v3 (global)..."

# Créer la structure
mkdir -p "$CLAUDE_DIR/commands"
mkdir -p "$CLAUDE_DIR/hooks"

# Copier les fichiers
cp "$SCRIPT_DIR/.claude/CLAUDE.md" "$CLAUDE_DIR/CLAUDE.md"
echo "  ✅ ~/.claude/CLAUDE.md"

cp "$SCRIPT_DIR/.claude/settings.json" "$CLAUDE_DIR/settings.json"
echo "  ✅ ~/.claude/settings.json"

cp "$SCRIPT_DIR/.claude/commands/save-memory.md" "$CLAUDE_DIR/commands/save-memory.md"
echo "  ✅ ~/.claude/commands/save-memory.md"

cp "$SCRIPT_DIR/.claude/hooks/"*.sh "$CLAUDE_DIR/hooks/"
chmod +x "$CLAUDE_DIR/hooks/"*.sh
echo "  ✅ ~/.claude/hooks/ (4 scripts)"

if [ -f "$SCRIPT_DIR/.claude/stop-hook-git-check.sh" ]; then
  cp "$SCRIPT_DIR/.claude/stop-hook-git-check.sh" "$CLAUDE_DIR/stop-hook-git-check.sh"
  chmod +x "$CLAUDE_DIR/stop-hook-git-check.sh"
  echo "  ✅ ~/.claude/stop-hook-git-check.sh"
fi

echo ""
echo "🎯 Usage :"
echo "  - /save-memory : sauvegarde complète (archiviste 8 phases)"
echo "  - Les hooks se déclenchent automatiquement (session, compact)"
echo "  - .memory/ est créé per-projet par /save-memory"
echo ""
echo "✅ Système mémoire v3 installé globalement."
