#!/usr/bin/env bash
# Watermark: Living_Sin (intricos777-dot) + AI agents (Hermes, Lia, opencode) - collaborative work
# Copyright (c) 2026 Living Sin (intricos777-dot) + AI agents (Hermes, Lia, opencode) - collaborative work
# Licensed under Living Sin Proprietary License (LSPL-1.0)
# See LICENSE file for details.
#
# Cursive Blood Build — installer.
# Copies everything under home/ into $HOME, backing up any existing file first.
# Idempotent and non-destructive: safe to re-run.
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOME_DIR="${HOME:-$(getent passwd "$(id -un)" | cut -d: -f6)}"
STAMP="$(date +%Y%m%d_%H%M%S)"
BACKUP="$HOME_DIR/.cursive-blood-backup/$STAMP"

if [ ! -d "$REPO/home" ]; then
  echo "error: $REPO/home not found — run from the repo checkout." >&2
  exit 1
fi

mkdir -p "$BACKUP"
count=0

while IFS= read -r src; do
  rel="${src#"$REPO"/home/}"
  dst="$HOME_DIR/$rel"

  if [ -e "$dst" ]; then
    mkdir -p "$BACKUP/$(dirname "$rel")"
    mv -f "$dst" "$BACKUP/$rel"
  fi

  mkdir -p "$(dirname "$dst")"
  cp -a "$src" "$dst"
  count=$((count + 1))
done < <(find "$REPO/home" -mindepth 1)

echo "Installed $count entries into $HOME_DIR"
echo "Backups written to $BACKUP"

if command -v fc-cache >/dev/null 2>&1; then
  fc-cache -f >/dev/null 2>&1 && echo "Font cache refreshed." || true
fi
