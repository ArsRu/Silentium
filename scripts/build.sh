#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROFILE_DIR="$ROOT_DIR/archiso"
OUT_DIR="$ROOT_DIR/out"
WORK_DIR="$ROOT_DIR/work"

if ! command -v mkarchiso >/dev/null 2>&1; then
  echo "[ERROR] mkarchiso not found. Install archiso first: sudo pacman -S archiso"
  exit 1
fi

echo "[+] Cleaning previous build artifacts"
rm -rf "$WORK_DIR"
mkdir -p "$OUT_DIR"

echo "[+] Building Silentium ISO"
mkarchiso -v -w "$WORK_DIR" -o "$OUT_DIR" "$PROFILE_DIR"

iso_path="$(find "$OUT_DIR" -maxdepth 1 -name 'silentium-*.iso' -o -name '*.iso' | head -n1)"
if [[ -n "${iso_path:-}" ]]; then
  echo "[+] ISO ready: $iso_path"
else
  echo "[WARN] Build finished, but ISO was not auto-detected. Check: $OUT_DIR"
fi
