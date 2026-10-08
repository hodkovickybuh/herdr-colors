#!/bin/sh
# Install herdr-colors (herdr fork with workspace colors) from GitHub Releases.
# Usage: curl -fsSL https://raw.githubusercontent.com/hodkovickybuh/herdr-colors/main/install.sh | sh
set -eu

REPO="hodkovickybuh/herdr-colors"
OS="$(uname -s)"
ARCH="$(uname -m)"

case "$OS" in
  Darwin) os_part="macos" ;;
  Linux) os_part="linux" ;;
  *) echo "unsupported OS: $OS" >&2; exit 1 ;;
esac
case "$ARCH" in
  arm64|aarch64) arch_part="aarch64" ;;
  x86_64) arch_part="x86_64" ;;
  *) echo "unsupported arch: $ARCH" >&2; exit 1 ;;
esac

NAME="herdr-${os_part}-${arch_part}"
URL="https://github.com/${REPO}/releases/latest/download/${NAME}"
TMP="$(mktemp)"
trap 'rm -f "$TMP"' EXIT

echo "downloading $NAME"
curl -fsSL -o "$TMP" "$URL"
curl -fsSL "https://github.com/${REPO}/releases/latest/download/${NAME}.sha256" | (cd "$(dirname "$TMP")" && sed "s|${NAME}|$(basename "$TMP")|" | shasum -a 256 -c -)

DEST="/usr/local/bin/herdr"
if [ -w /usr/local/bin ]; then
  mv "$TMP" "$DEST"
else
  sudo -v
  sudo mv "$TMP" "$DEST"
fi
chmod +x "$DEST"

if command -v brew >/dev/null 2>&1 && brew list --versions herdr >/dev/null 2>&1; then
  echo "note: homebrew herdr is also installed; 'brew uninstall herdr' (or 'brew unlink herdr') avoids shadowing"
fi

echo "installed: $("$DEST" --version) at $DEST"
echo "run: herdr"
