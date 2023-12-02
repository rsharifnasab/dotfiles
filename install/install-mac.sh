#!/usr/bin/bash

set -e
set -o nounset
set -o pipefail

(
    # turn off annoying accent menu pop up
    defaults write -g ApplePressAndHoldEnabled -bool false

    # install git/other needed requirements
    sudo xcode-select --install

    #install brew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'export PATH="$PATH:/opt/homebrew/bin' >>~/.site.sh
)
(
    brew install stow lsd zsh git

    cd "$HOME"
    mkdir -p proj
    git clone https://github.com/rsharifnasab/dotfiles.git
    cd dotfiles
    bash ./configs/bin/sync_home
)

(
    brew install git bash zsh
    brew install firefox skype kitty chromium vlc geany obs drawio
    brew install moreutils nnn fd ripgrep wget the_silver_searcher aria2
    brew install jcal safe-rm ipython tokei pfetch screenfetch
    brew install node speedtest-cli bat-extras jq
    brew install coreutils inetutils rar
    brew install ncdu tty-clock poppler
    brew install watch languagetool htop btop
    brew install keka the-unarchiver
    xattr -cr /Applications/Chromium.app
)
(
    #install firacode font
    brew tap homebrew/cask-fonts
    brew install --cask font-fira-code-nerd-font
    brew install --cask font-fira-mono-nerd-font
)
(
    brew install just stylua prettier shellcheck lazygit
    brew install mongosh gofumpt go k6
    brew install nats-io/nats-tools/nats
    brew install openshift-client helm
    # orbstack instead of docker desktop
    brew install orbstack homebrew/cask/docker lazydocker
    brew install docker-completion docker-compose docker-compose-completion
    # set this registry in ~/.docker/daemon.json:         "https://docker.iranserver.com"

    go install mvdan.cc/sh/v3/cmd/shfmt@latest
)
(
    # neovim
    brew install nvim
    sudo npm install -g neovim
    /Library/Developer/CommandLineTools/usr/bin/python3 -m pip install --upgrade pip
    pip3 install --user pynvim
)
(
    # tex and markdown
    brew install mactex texstudio

    brew install mark-text
    xattr -cr /Applications/MarkText.app
)
(
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
)
(
    brew install proxychains-ng xray openfortivpn
    # to disable SIP
    # in recovery mode: csrutil disable
    #https://github.com/rofl0r/proxychains-ng/issues/481
)
(
    brew install python3
    brew install pyright pylint autopep8 mypy
)
(
    # gopass
    brew install gopass
    gpg --full-generate-key

    brew install pinentry-mac
    PINENTRY=$(which pinentry-mac)
    echo "pinentry-program ${PINENTRY}" >>~/.gnupg/gpg-agent.conf
    defaults write org.gpgtools.common UseKeychain NO
)
(
    # fix capslock problems:
    brew intsall karabiner-elements
    # then use this: https://apple.stackexchange.com/a/456649
)
(
    # download telegram desktop dmg
    wget -c "https://telegram.org/dl/desktop/mac"
)
