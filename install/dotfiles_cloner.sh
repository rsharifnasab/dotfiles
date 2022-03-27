#!/bin/bash

set -e
set -o nounset
set -o pipefail

command -v git ||  {
    echo "git is not installed"
    exit 1
}
cd "$HOME"
mkdir -p proj
cd proj
git clone https://github.com/rsharifnasab/dotfiles.git
cd dotfiles
./bin/sync_home

