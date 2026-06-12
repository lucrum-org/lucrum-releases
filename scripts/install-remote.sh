#!/usr/bin/env bash
set -euo pipefail

# Downloads the latest Lucrum release from GitHub and installs it locally.
# Override the repo with: LUCRUM_INSTALL_REPO=your-org/lucrum-terminal

REPO="${LUCRUM_INSTALL_REPO:-lucrum-org/lucrum-releases}"
INSTALL_DIR="${INSTALL_DIR:-$HOME/.local/bin}"
APP_NAME="${APP_NAME:-Lucrum}"
BUILD_APP="${BUILD_APP:-1}"

download_release_asset() {
  local asset="$1"
  local out="$2"

  if command -v gh >/dev/null 2>&1; then
    local dir file
    dir="$(dirname "$out")"
    gh release download --repo "$REPO" -p "$asset" -D "$dir" --clobber
    file="$dir/$asset"
    if [[ "$file" != "$out" ]]; then
      mv "$file" "$out"
    fi
    return
  fi

  local tag url
  tag="$(curl -fsSL "https://api.github.com/repos/${REPO}/releases/latest" \
    | python3 -c "import json,sys; print(json.load(sys.stdin)['tag_name'])")"
  url="https://github.com/${REPO}/releases/download/${tag}/${asset}"
  if curl -fsSL -o "$out" "$url"; then
    return
  fi

  local token asset_id
  token="${GITHUB_TOKEN:-}"
  if [[ -z "$token" ]]; then
    echo "error: download failed; install gh CLI or set GITHUB_TOKEN" >&2
    exit 1
  fi

  asset_id="$(curl -fsSL -H "Authorization: Bearer ${token}" \
    "https://api.github.com/repos/${REPO}/releases/latest" \
    | python3 -c "import json,sys; print(next(a['id'] for a in json.load(sys.stdin)['assets'] if a['name']=='${asset}'))")"
  curl -fsSL \
    -H "Authorization: Bearer ${token}" \
    -H "Accept: application/octet-stream" \
    "https://api.github.com/repos/${REPO}/releases/assets/${asset_id}" \
    -o "$out"
}

OS="$(uname -s)"
ARCH="$(uname -m)"

case "$OS-$ARCH" in
  Darwin-arm64) ASSET="lucrum-aarch64-apple-darwin.tar.gz" ;;
  Darwin-x86_64) ASSET="lucrum-x86_64-apple-darwin.tar.gz" ;;
  Linux-x86_64) ASSET="lucrum-x86_64-unknown-linux-gnu.tar.gz" ;;
  Linux-aarch64) ASSET="lucrum-aarch64-unknown-linux-gnu.tar.gz" ;;
  *)
    echo "error: unsupported platform: $OS $ARCH" >&2
    exit 1
    ;;
esac

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

echo "Downloading ${ASSET} from ${REPO} ..."
download_release_asset "$ASSET" "$TMP_DIR/lucrum.tar.gz"
tar -xzf "$TMP_DIR/lucrum.tar.gz" -C "$TMP_DIR"

mkdir -p "$INSTALL_DIR"
BINARY="$TMP_DIR/lucrum"
if [[ ! -f "$BINARY" ]]; then
  BINARY="$TMP_DIR/dist-lucrum"
fi
install -m 755 "$BINARY" "$INSTALL_DIR/lucrum"
echo "Installed: $INSTALL_DIR/lucrum"

case ":$PATH:" in
  *":$INSTALL_DIR:"*) ;;
  *)
    echo
    echo "Add this to your shell profile (~/.zshrc):"
    echo "  export PATH=\"$INSTALL_DIR:\$PATH\""
    ;;
esac

if [[ "$BUILD_APP" == "1" && "$OS" == "Darwin" ]]; then
  APP_ZIP_ASSET=""
  case "$ARCH" in
    arm64) APP_ZIP_ASSET="Lucrum-macOS-aarch64.zip" ;;
    x86_64) APP_ZIP_ASSET="Lucrum-macOS-x86_64.zip" ;;
  esac

  if [[ -n "$APP_ZIP_ASSET" ]]; then
    echo "Downloading ${APP_ZIP_ASSET} from ${REPO} ..."
    download_release_asset "$APP_ZIP_ASSET" "$TMP_DIR/Lucrum.zip"
    rm -rf "$HOME/Applications/${APP_NAME}.app"
    unzip -q "$TMP_DIR/Lucrum.zip" -d "$HOME/Applications"
    echo "Installed app: $HOME/Applications/${APP_NAME}.app"
  fi
fi

echo
echo "Run from any terminal:"
echo "  lucrum"
