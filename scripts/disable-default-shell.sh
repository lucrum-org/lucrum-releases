#!/usr/bin/env bash
set -euo pipefail

# Removes Lucrum auto-start from ~/.zshrc (pair of enable-default-shell.sh).

ZSHRC="${ZSHRC:-$HOME/.zshrc}"
MARKER_START="# >>> lucrum default shell >>>"
MARKER_END="# <<< lucrum default shell <<<"

if [[ ! -f "$ZSHRC" ]]; then
  echo "No $ZSHRC found; nothing to remove"
  exit 0
fi

if ! grep -qF "$MARKER_START" "$ZSHRC"; then
  echo "Lucrum auto-start is not configured in $ZSHRC"
  exit 0
fi

python3 - "$ZSHRC" "$MARKER_START" "$MARKER_END" <<'PY'
import sys
from pathlib import Path

path = Path(sys.argv[1])
start = sys.argv[2]
end = sys.argv[3]
lines = path.read_text().splitlines(keepends=True)
out = []
skip = False
for line in lines:
    if start in line:
        skip = True
        continue
    if end in line:
        skip = False
        continue
    if not skip:
        out.append(line)
path.write_text("".join(out).rstrip("\n") + "\n" if out else "")
PY

echo "Removed Lucrum auto-start from $ZSHRC"
