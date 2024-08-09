#!/bin/bash

set -e
set -o nounset
set -o pipefail

if ! [ -x "$(command -v git)" ]; then
    echo "git is not installed. please install it first"
    exit 1
fi

echo "create directory structure"
cd "$HOME"
mkdir -p proj
cd proj
git clone --branch master --depth 1 https://github.com/rsharifnasab/dotfiles.git
cd dotfiles
sudo pacman -S --needed stow vim reflector
bash ./configs/bin/sync_home
