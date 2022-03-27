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
./bin/sync_home

