#!/usr/bin/bash

set -e
set -o nounset
set -o pipefail

sudo xcode-select --install

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'export PATH="$PATH:/opt/homebrew/bin'


brew install stow lsd

cd "$HOME"
mkdir -p proj
git clone https://github.com/rsharifnasab/dotfiles.git
cd dotfiles
bash ./configs/bin/sync_home


brew install firefox skype kitty 
brew install tldr moreutils nnn fd ripgrep wget the_silver_searcher
brew install jcal safe-rm ipython vlc #obs
brew install nvim node shellcheck 
brew install homebrew/cask/docker # docker desktop
# set this registry in ~/.docker/daemon.json:         "https://docker.iranserver.com"
brew install nats-io/nats-tools/nats


sudo npm install -g neovim
/Library/Developer/CommandLineTools/usr/bin/python3 -m pip install --upgrade pip
pip3 install --user pynvim



git clone --depth 1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh

# archcraft zsh theme
(
cd ~/.oh-my-zsh/themes || exit
git clone https://github.com/mrx04programmer/ZshTheme-ArchCraft/
mv ZshTheme-ArchCraft/archcraft-dwm.zsh-theme "$PWD"
)


# autosuggestion, fast syntax highlight, autocomplete
git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions \
    ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone --depth 1 https://github.com/zdharma-continuum/fast-syntax-highlighting.git \
    ~/.oh-my-zsh/custom/plugins/fast-syntax-highlighting
git clone --depth 1 https://github.com/marlonrichert/zsh-autocomplete.git \
    ~/.oh-my-zsh/custom/plugins/zsh-autocomplete

#install fzf for zsh and other
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install


git clone --depth 1 https://github.com/wbthomason/packer.nvim \
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
