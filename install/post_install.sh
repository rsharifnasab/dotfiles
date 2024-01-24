#!/bin/bash
#set -e
#set -o nounset
#set -o pipefail

function latex() {
    inst tectonic \
        texlive-bin texlive-basic texlive-xetex \
        texlive-latex texlive-latexextra \
        texlive-fontsrecommended texlive-binextra \
        ed dialog wdiff \
        texstudio \
        evince okular languagetool

    (
        cd /usr/share/texmf-dist/scripts/texlive || return
        sudo sed -i 's/\$Master = "\$Master\/..\/..";/\$Master = "\$Master\/..\/..\/..";/' ./tlmgr.pl
    )

    tlmgr init-usertree
    tlmgr option repository http://mirrors.rit.edu/CTAN/systems/texlive/tlnet

    sudo fmtutil-sys --all
}

function pre_install() {
    # update the system before anything!
    # install minimum tools to survive next steps!
    sudo pacman -Sy --noconfirm archlinux-keyring
    sudo pacman -Syu
    sudo pacman -R --noconfirm vim || true
    sudo pacman -S --needed --noconfirm base-devel gvim xsel xclip wget curl \
        stow man-pages man lsof bc rsync reflector
}

function inst() {
    if hash paru paru 2>/dev/null; then
        paru -S --needed --noconfirm $*
    else
        pacman -S --needed --noconfirm $*
    fi
}
function aur_helper() {
    # if distro repo has paru, use it!
    paru -h || sudo pacman -S paru || (
        # or else: install from source
        cd /tmp || exit
        git clone https://aur.archlinux.org/paru-bin.git
        cd paru-bin || exit
        makepkg -si --noconfirm --needed
    )
}

function ta() {
    inst astyle splint firejail \
        clang-format-static-bin
}

function compilers() {
    inst nodejs npm go python3 python-pip \
        rustup jdk-openjdk lua elixir
}

function neovim_full() {
    inst neovim prettier

    # nvim packer
    git clone --depth 1 https://github.com/wbthomason/packer.nvim \
        ~/.local/share/nvim/site/pack/packer/start/packer.nvim

    # requiered packages for neovim
    inst python-msgpack python-pynvim fd ripgrep
    sudo npm install -g neovim
    # sync plugins
    nvim +PackerSync
    nvim +UpdateRemotePlugins
    nvim +CocUpdate
}

function terminal_full() {
    inst zsh moreutils \
        kitty ttf-fira-code ttf-firacode-nerd \
        tree tldr fd nnn source-highlight mtr \
        the_silver_searcher httpie lazygit gitui \
        just usbutils pciutils
}

function internet() {
    inst proxychains-ng xray-bin sing-box-bin jdk-openjdk
}

function shell_devel() {
    go install mvdan.cc/sh/v3/cmd/shfmt@latest
    inst shellcheck-bin
}

function cpp_devel() {
    inst clang ctags cmake astyle
}

function js_devel() {
    # for js development
    inst eslint tidy stylelint
    sudo npm -g install js-beautify
}

function haskell_devel() {
    inst ghc-static stack cabal-install hlint stylish-haskell
}

function rust_devel() {
    rustup install stable
    rustup default stable
    inst rust-analyzer
    rustup component add rust-analysis rust-src
    rustup component add clippy
    rustup component add rustfmt
}

function text_linters() {
    #    grammer check offline but slow
    inst languagetool

    # fast and have options
    # inst vale
    # vale sync
    # read and sync styles from .vale.ini
    # more info: https://vale.sh/generator/

    # fast, foxus on non-offending writing
    # sudo npm install alex --global
}

function virtualbox() {
    inst virtualbox virtualbox-host-modules-arch virtualbox-guest-iso virtualbox-ext-oracle
}

function desktop_packages() {
    mkdir -p ~/Desktop ~/Pictures ~/Music ~/Videos ~/Downloads ~/Documents
    inst firefox chromium \
        noto-fonts noto-fonts-emoji ttf-linux-libertine ttf-dejavu \
        ntfs-3g pacman-contrib dnsutil inetutils lxrandr \
        zip unzip unrar xarchiver engrampa \
        variety flameshot redshift \
        nano xed tmux zellij jcal btop tokei aria2 acpi tty-clock \
        ncdu qrencode viu speedtet-cli ipython \
        vlc shotwell telegram-desktop meld thunar obs-studio \
        pandoc-bin typora-free \
        gparted \
        speedtest-cli bind # net utils

    # prevent rm from deleting important files
    sudo npm i -g safe-rm

}

function desktop_packages_extra() {
    inst typora marp-cli-bin marktext-bin termius
    inst skypeforlinux-stable-bin gnome-keyring

}

function fonts(){
    # install persian font (from here: https://github.com/fzerorubigd/persian-fonts-linux)
    printf "37\nyes\n" |
        bash -c "$(curl -fsSL https://raw.githubusercontent.com/fzerorubigd/persian-fonts-linux/master/farsifonts.sh)"
}

function zsh_full() {
    #install oh my zsh
    #sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
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

    #install zsh plugin : zsh-vi-mode
    #git clone https://github.com/jeffreytse/zsh-vi-mode \
    #  $HOME/.oh-my-zsh/custom/plugins/zsh-vi-mode

    chsh -s "$(which zsh)"

    #install fzf for zsh and other
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
}

function java_devel() {
    inst astyle
    # only of opened a java file
    # nvim +CocCommand java.updateLanguageServer

    sudo mkdir /usr/local/share/lombok
    sudo wget https://projectlombok.org/downloads/lombok.jar -O /usr/local/share/lombok/lombok.jar
}

function python_devel() {
    mkdir -p ~/apps
    (
        cd ~/apps || exit
        python -m venv venv
        source "venv/bin/activate"
        pip3 install --upgrade pip pylint pynvim ipython
        pip3 install --upgrade numpy pandas matplotlib plotly networkx pillow

        pip3 install mypy pandas-stubs data-science-types # python static type check (work with ale)
        #mypy --install-types
    )

    inst python-pylint python-black pyright autopep8

    #inst python-pylint-venv python-pipenv python-pytest \
    # python-rednose python-pytest autopep8
}

function lua_devel() {
    inst stylua luajit
}

function micro() {
    # micro text editor
    curl https://getmic.ro | bash
    \sudo \mv ./micro /usr/bin/micro
}

function emacs() {
    inst emacs
    rm -r ~/.emacs.d
    git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
    ~/.emacs.d/bin/doom install

    #to updare:
    ~/.emacs.d/bin/doom upgrade
    #add doom binary to path:
    sudo ln -s ~/.emacs.d/bin/doom /usr/bin/doom

    # copy dotfiles to home folder
    ./bin/update -d
}

function ubuntu() {
    sudo apt install python-neovim python3-neovim \
        snapd cmake npm gcc g++ zsh-autosuggestions tldr \
        nnn fzf tree shellcheck xsel httpie clang ctags dnsutils

    # install recent version of this packages
    sudo snap install nvim --classic
    sudo snap install go --classic
}

function hotspot() {
    inst dnsmasq linux-wifi-hotspot
    # then run: wihotspot
}

function bluetooth() {
    inst bluez bluez-tools bluez-utils blueman
    sudo systemctl enable bluetooth.service
    sudo systemctl start bluetooth.service
    rfkill unblock all
}

function grub_fix() {
    sudo bash -c 'echo "GRUB_DISABLE_OS_PROBER=false" >> /etc/default/grub.'
    inst os-prober
    os-prober
    sudo grub-mkconfig -o /boot/grub/grub.cfg
}
function wallpaper() {
    mkdir -p ~/Pictures/
    git clone --branch master --depth 1 "https://github.com/rsharifnasab/wallpapers.git" \
        ~/Pictures/wallpapers
    variety &
}

function docker_install() {
    inst docker docker-compose
    sudo mkdir -p /etc/docker
    echo '{"registry-mirrors": ["https://docker.iranserver.com"]}' |
        sudo tee /etc/docker/daemon.json
}

function fingerprint(){
    sudo gpasswd -a "$USER" input
    inst fprintd
    fprintd-enroll roozbeh -f "right-index-finger"
    fprintd-enroll roozbeh -f "left-index-finger"
    fprintd-list
    # in casy of any issue:
    # \rm -rf /var/lib/fprint

    # add "auth    sufficient    pam_fprintd.so" to first of these files:
    # /etc/pam.d/xfce4-screensaver
    # /etc/pam.d/sudo
    # /etc/pam.d/system-local-login
}

function touchpad(){
    sudo gpasswd -a "$USER" input
    inst ruby libinput ruby-fusuma xdotool
    gsettings set org.gnome.desktop.peripherals.touchpad send-events enabled || true
    # https://github.com/iberianpig/fusuma/blob/main/README.md
}

function laptop(){
    inst tlp ethtool
    sudo systemctl enable tlp.service
    sudo systemctl start tlp.service
    tlp-stat -s
    # sudo tlp-stat
}

function run() {
    pre_install
    aur_helper
    compilers
    zsh_full
    terminal_full
    neovim_full
    bluetooth
    desktop_packages
    desktop_packages_extra
    fonts
    ta
    cpp_devel
    java_devel
    python_devel
    shell_devel
    lua_devel
    #docker_install
    #rust_devel
    #text_linters
    #haskell_devel
    #js_devel
    #micro
    #emacs
    #ubuntu
}

#run
