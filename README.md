# Dotfiles Setup

This repository contains configuration files (dotfiles) and a setup script to quickly configure a new system or synchronize your environment across multiple machines.

## Prerequisites

- Bash (tested with Bash 4+)

## Usage

Run the following command to setup the dotfiles:

```bash
bash setup.sh <setup_dir>
```

`<setup_dir>` is a path to the folder containing the dotfiles you want to install, i.e. `setup_1`. For each file in this folder, a symlink will be created in the home-directory as follows:

* if we have the file `<setup_dir>/foo/bar.txt` and `~/foo/bar.txt` does not exist, then the symlink `~/foo/bar.txt -> <setup_dir>/foo/bar.txt` is created.
* if we have the file `<setup_dir>/foo/bar.txt` and `~/foo/bar.txt` exists, then `~/foo/bar.txt` is moved to `backups/backup_at_yyymmdd-hhmmss/foo/bar.txt` and the symlink `~/foo/bar.txt -> <setup_dir>/foo/bar.txt` is created.
* if we have the file `<setup_dir>/foo/bar.txt` and `~/foo/bar.txt` is already a symlink to `<setup_dir>/foo/bar.txt`, then nothing happens.