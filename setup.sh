#!/usr/bin/env bash

if [ "$#" -ne 1 ]; then
	echo "ERROR: Requires one argument, i.e. 'setup <setup_dir>'." >&2
	exit 1
fi

SETUP_DIR="$1"
TARGET_DIR="$HOME"
BACKUP_DIR="$(dirname "${BASH_SOURCE[0]}")/backups"

mkdir -p "$BACKUP_DIR"

bash generic_setup.sh "$SETUP_DIR" "$TARGET_DIR" "$BACKUP_DIR"

