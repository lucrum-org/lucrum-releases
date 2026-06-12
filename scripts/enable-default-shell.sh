#!/usr/bin/env bash
set -euo pipefail

# Appends Lucrum auto-start to ~/.zshrc so new interactive terminals open in Lucrum.
# Idempotent: safe to run more than once.

ZSHRC="${ZSHRC:-$HOME/.zshrc}"
MARKER_START="# >>> lucrum default shell >>>"
MARKER_END="# <<< lucrum default shell <<<"

if [[ ! -f "$ZSHRC" ]]; then
  touch "$ZSHRC"
fi

if grep -qF "$MARKER_START" "$ZSHRC"; then
  echo "Lucrum auto-start is already configured in $ZSHRC"
  exit 0
fi

if ! command -v lucrum >/dev/null 2>&1; then
  echo "warning: lucrum is not in PATH yet; install it before opening a new terminal" >&2
fi

cat >>"$ZSHRC" <<'EOF'

# >>> lucrum default shell >>>
if [[ -z "${LUCRUM_SESSION:-}" && $- == *i* ]]; then
  export LUCRUM_SESSION=1
  exec lucrum
fi
# <<< lucrum default shell <<<
EOF

echo "Added Lucrum auto-start to $ZSHRC"
echo "Open a new terminal, or run: source $ZSHRC"
