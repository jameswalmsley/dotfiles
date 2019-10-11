# James' Dotfiles

# First-time Install

```bash
export GIT_WORK_TREE=~/
export GIT_DIR=~/.dot-files.git
mkdir -p ~/.dot-files.git
git init
git remote add origin https://github.com/jameswalmsley/dotfiles.git
git fetch
git checkout master

# Add --force if you have untracked files that would be overwritten.
# Backup first!

# git checkout master -f

```

Restart bash and login fresh.

# Usage

## Git

You can now access the dot-file git repository from anywhere using the
h command:

```
h git pull
h git status
hs
h git add .bashrc
h git commit
h git push
```

This also works in fish.

## SSH

You can sync your ssh key to other hosts authorized_keys file:

```bash
# Bash only.
hkey user@hostname
```

## Sync Dotfiles.

You can install to another host (use hkey first)..

```bash
# Bash only.
hinit user@hostname
```

And pull in files for another host.

```bash
# Bash only.
hsync user@hostname
```

