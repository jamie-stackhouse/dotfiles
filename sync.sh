#!/bin/bash
cd "$(dirname "$0")"
git pull
function doIt() {
  rsync --exclude ".git/" --exclude "osx.sh" --exclude ".DS_Store" --exclude "sync.sh" --exclude "brew.sh" --exclude "brew-cask.sh" --exclude "install-deps.sh" --exclude "README.md" -av . ~
}
if [ "$1" == "--force" -o "$1" == "-f" ]; then
  doIt
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt
  fi
fi
unset doIt
source ~/.bash_profile