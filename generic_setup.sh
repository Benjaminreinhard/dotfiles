#!/usr/bin/env bash


# 1. Validate number of arguments

if [ "$#" -ne 3 ]; then
	echo "ERROR: Requires three arguments, i.e. " \
		"'generic_setup <setup_dir> <taget_dir> <backups_dir>'." >&2
	exit 1
fi

SETUP_DIR="$1"
TARGET_DIR="$2"
BACKUPS_DIR="$3"

# 2. Validate existence of directories

if [ ! -d "$SETUP_DIR" ]; then
	echo "ERROR: Setup-directory '$SETUP_DIR' does not exist." >&2
	exit 1
fi

if [ ! -d "$TARGET_DIR" ]; then
	echo "ERROR: Target-directory '$TARGET_DIR' does not exist." >&2
	exit 1
fi

if [ ! -d "$BACKUPS_DIR" ]; then
	echo "ERROR: Backups-directory '$BACKUPS_DIR' does not exist." >&2
	exit 1
fi

SETUP_DIR="$(realpath "$SETUP_DIR")"
TARGET_DIR="$(realpath "$TARGET_DIR")"
BACKUP_DIR="$(realpath "$BACKUPS_DIR")/backup_at_$(date "+%Y%m%d-%H%M%S")"

if [ -d "$BACKUP_DIR" ]; then
  BACKUP_DIR="${BACKUP_DIR}_2"
fi

# 3. Validate properness of Setup-directory

for path in $(find $SETUP_DIR -mindepth 1); do
	if [ ! -f "$path" ] && [ ! -d "$path" ]; then
		echo "ERROR: Setup-directory can only contain directories, files " \
			"and symlinks. '$path' is neither of it." >&2
		exit 1
	fi

	if [ -L "$path" ] && [ ! -e "$path" ]; then
		echo "ERROR: Setup-directory contains a broken symlink, namely '$path'." >&2
		exit 1
	fi
done

# 4. Validate the safety to create symlinks in Target-directory

for path in $(find $SETUP_DIR -mindepth 1 -type f); do
	path_without_setup="${path#"$SETUP_DIR"}"
	target_path="$TARGET_DIR$path_without_setup"

	if [ -e "$target_path" ] && [ ! -f "$target_path" ]; then
		echo "ERROR: '$target_path' exists and is not a file or symlink." >&2
		exit 1
	fi
done

# 5. Create symlinks and backups, if necessary

for path in $(find $SETUP_DIR -mindepth 1 -type f); do
	path_without_setup="${path#"$SETUP_DIR"}"

	target_path="$TARGET_DIR$path_without_setup"
	target_dir="$(dirname "$target_path")"

	if [ -L "$target_path" ] && [ "$path" == "$(readlink -f "$target_path")" ]; then
		continue
  fi

	if [ -e "$target_path" ] || [ -L "$target_path" ]; then
		backup_path="$BACKUP_DIR$path_without_setup"
		backup_dir="$(dirname "$backup_path")"
		mkdir -p "$backup_dir"
		mv "$target_path" "$backup_dir"
	fi

	mkdir -p "$target_dir"
	ln -s "$path" "$target_path"
done

