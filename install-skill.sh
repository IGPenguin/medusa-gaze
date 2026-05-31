#!/bin/bash
# Installs the Medusa Gaze /medusa skill into Claude Code.

set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
MEDUSA_CONFIG="$HOME/.claude/medusa"

echo "🐍 Installing Medusa Gaze..."

# 1. Register the GitHub repo as a marketplace (idempotent)
if claude plugins marketplace list 2>/dev/null | grep -q "medusa-gaze"; then
    claude plugins marketplace update medusa-gaze 2>/dev/null || true
else
    claude plugins marketplace add IGPenguin/medusa-gaze --scope user
fi

# 2. Install (or update) the medusa plugin
if claude plugins list 2>/dev/null | grep -q "medusa@medusa-gaze"; then
    claude plugins update medusa@medusa-gaze 2>/dev/null || true
else
    claude plugins install medusa@medusa-gaze --scope user
fi

# 3. Copy user-editable config files — never overwrites existing customizations
mkdir -p "$MEDUSA_CONFIG"
cp -n "$REPO_DIR/.medusa/papyrus.md" "$MEDUSA_CONFIG/papyrus.md" 2>/dev/null && echo "  wrote papyrus.md" || echo "  papyrus.md already exists, skipped"
cp -n "$REPO_DIR/.medusa/manifesto.md" "$MEDUSA_CONFIG/manifesto.md" 2>/dev/null && echo "  wrote manifesto.md" || echo "  manifesto.md already exists, skipped"

echo "✨ Done. Restart Claude Code, then type /medusa in any project."
