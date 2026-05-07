# Dotfiles

This repository contains configuration files (dotfiles) and a setup script to quickly configure a new workstation.

## Requirements

Bash or Zsh

## Usage

Run the following command to setup the dotfiles:

```bash
bash setup.sh <setup_dir>
```

`<setup_dir>` is a path to the folder containing the dotfiles you want to install. For each file in this folder, a symlink will be created starting from home-directory as follows:

**Case 1:** If `<setup_dir>/foo/bar.txt` exists and `~/foo/bar.txt` does not, then a symlink
```bash
~/foo/bar.txt -> <setup_dir>/foo/bar.txt`
```
is created.

**Case 2:** If `<setup_dir>/foo/bar.txt` and `~/foo/bar.txt` exist, then `~/foo/bar.txt` is moved to `backups/backup_at_yyymmdd-hhmmss/foo/bar.txt` and a symlink `~/foo/bar.txt -> <setup_dir>/foo/bar.txt` is created.

**Case 3:** If `<setup_dir>/foo/bar.txt` exists and `~/foo/bar.txt` is already a symlink to `<setup_dir>/foo/bar.txt`, then nothing happens.
