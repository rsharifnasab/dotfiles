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
git clone https://github.com/rsharifnasab/dotfiles.git
cd dotfiles
sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist
sudo pacman -S --needed stow vim
bash ./configs/bin/sync_home
