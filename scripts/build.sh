#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROFILE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
WORK_DIR="$PROFILE_DIR/work"
OUT_DIR="$PROFILE_DIR/out"

if ! command -v mkarchiso >/dev/null 2>&1; then
  echo "[ERROR] mkarchiso not found. Install archiso package first:" >&2
  echo "        sudo pacman -S archiso" >&2
  exit 1
fi

echo "[INFO] Cleaning previous build artifacts"
sudo rm -rf "$WORK_DIR" "$OUT_DIR"
mkdir -p "$WORK_DIR" "$OUT_DIR"

echo "[INFO] Building Silentium ISO from profile: $PROFILE_DIR"
sudo mkarchiso \
  -v \
  -w "$WORK_DIR" \
  -o "$OUT_DIR" \
  "$PROFILE_DIR"

ISO_PATH="$(find "$OUT_DIR" -maxdepth 1 -type f -name 'silentium-*.iso' | sort | tail -n1)"
if [[ -z "$ISO_PATH" ]]; then
  echo "[ERROR] Build finished but ISO file not found in $OUT_DIR" >&2
  exit 1
fi

echo "[OK] ISO created: $ISO_PATH"
