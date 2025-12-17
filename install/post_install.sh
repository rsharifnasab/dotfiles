#!/bin/bash
#set -e
#set -o nounset
#set -o pipefail

SCRIPT_DIR="$(cd "$(dirname "$(readlink -f "$0")")" && pwd)"
FILES_DIR="$SCRIPT_DIR/files"

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
        stow man-pages man lsof bc rsync reflector lsd bat
}

function inst() {
    if hash paru paru 2>/dev/null; then
        paru -S --needed --noconfirm "$@"
    else
        echo "WARN: paru not found"
        pacman -S --needed --noconfirm "$@"
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
    inst npm yarn go python3 python-pip \
        rustup jdk-openjdk lua \
        clang cmake
}

function neovim_new() {
    inst git make unzip ripgrep fd xsel \
        ttf-firacode-nerd ruby npm tree-sitter-cli \
        luarocks lua51 \
        uv python3

    gem install neovim
    sudo npm install -g neovim

    (
        uv venv "$HOME/.venvs/nvim"
        source "$HOME/.venvs/nvim/bin/activate" && uv pip install pynvim
    )

    #git clone https://github.com/rsharifnasab/my-neovim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

    nvim --headless "+echo has('ruby')" +q # verify

}

function terminal_full() {
    inst \
        zsh kitty guake tmux \
        nano xed \
        ttf-fira-code ttf-firacode-nerd awesome-terminal-fonts \
        tree fd nnn zoxide \
        the_silver_searcher fzf jq yq pdfgrep \
        tealdeer bat just navi \
        usbutils pciutils acpi \
        aria2 speedtest-cli bind \
        fastfetch pfetch-rs-bin rm-improved-bin \
        jcal btop tokei ncdu tty-clock viu qrencode \
        python-tqdm tre-command-bin git-extras \
        moreutils

    navi repo add denisidoro/navi-tldr-pages
    navi repo browse # add tldr repo to navi

    chsh -s "$(which zsh)"
}

function terminal_extra() {
    inst \
        gitui lazygit \
        gping hyperfine mtr httpie \
        sd source-highlight
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
    inst eslint tidy stylelint yarn
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
    #rustup component add rustfmt
}

function redis_devel() {
    inst tiny-rdm-bin redis webkit2gtk
}

function text_linters() {
    #    grammar check offline but slow
    inst languagetool

    # fast and have options
    # inst vale
    # vale sync
    # read and sync styles from .vale.ini
    # more info: https://vale.sh/generator/

    # fast, focus on non-offending writing
    # sudo npm install alex --global
}

function virtualbox() {
    inst virtualbox virtualbox-host-modules-arch virtualbox-guest-iso virtualbox-ext-oracle
}

function desktop_packages() {
    mkdir -p "$HOME/Desktop" "$HOME/Pictures" "$HOME/Music" "$HOME/Videos" "$HOME/Downloads" "$HOME/Documents"

    inst \
        firefox chromium \
        noto-fonts noto-fonts-emoji \
        ttf-linux-libertine ttf-dejavu \
        ntfs-3g pacman-contrib inetutils \
        lxrandr gparted \
        zip unzip unrar xarchiver engrampa p7zip \
        variety flameshot \
        vlc shotwell telegram-desktop \
        meld thunar obs-studio \
        obsidian zed \
        proton-authenticator-bin

    # prevent rm from deleting important files
    sudo npm i -g safe-rm

    # remove this package to let chromium open!
    # pacman -Rns xf86-video-intel package
}

function desktop_packages_extra() {
    (
        inst redshift

        mkdir -p "$HOME/.config/systemd/user/"
        cp "$FILES_DIR/redshift.service" "$HOME/.config/systemd/user/"
    )

    # pdf manipulation
    inst pdftk poppler

    inst typora marp-cli-bin marktext-bin logseq-desktop-bin termius fswatch

    # seahorse to change keyring password for skype
    inst gnome-keyring seahorse \
        mission-center thunderbird

    inst pandoc-bin
    inst galaxybudsclient-bin
    inst spotify-launcher

}

function fonts() {
    # install persian font (from here: https://github.com/fzerorubigd/persian-fonts-linux)
    printf "37\nyes\n" |
        bash -c "$(curl -fsSL https://raw.githubusercontent.com/fzerorubigd/persian-fonts-linux/master/farsifonts.sh)"
}

function zsh_atuin() {
    # install atuin
    curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
    # atuin login
    atuin import zsh

    atuin history prune --dry-run
    atuin history prune

    atuin sync

    mkdir -p "$HOME/.zsh/completions"
    atuin gen-completions --shell zsh --out-dir "$HOME"/.zsh/completions

    atuin info
}

function python_devel() {
    inst uv python

    uv tool install ipython
    uv tool install ruff
    uv tool install autopep8
    uv tool install pyright
    uv tool install black
    uv tool install blue
    uv tool install pylint

    #inst python-pytest python-rednose
}

function micro() {
    curl https://getmic.ro | bash
    \sudo "\mv" ./micro /usr/bin/micro
}

function emacs() {
    inst emacs
    rm -r "$HOME/.emacs.d"
    git clone --depth 1 https://github.com/hlissner/doom-emacs "$HOME/.emacs.d"
    "$HOME/.emacs.d/bin/doom" install

    #to updare:
    "$HOME/.emacs.d/bin/doom" upgrade
    #add doom binary to path:
    sudo ln -s "$HOME/.emacs.d/bin/doom" /usr/bin/doom

    # copy dotfiles to home folder
    ./bin/update -d
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
    mkdir -p "$HOME/Pictures/"
    git clone --branch master --depth 1 "https://github.com/rsharifnasab/wallpapers.git" \
        "$HOME/Pictures/wallpapers"
    variety &
}

function docker_install() {
    inst docker docker-compose
    sudo mkdir -p /etc/docker
    echo '{"registry-mirrors": ["https://docker.iranserver.com"]}' |
        sudo tee /etc/docker/daemon.json

    sudo usermod -aG docker "$USER"
}

function ease_sudo() {
    sudo cp "$FILES_DIR/sudoer-roozbeh" /etc/sudoers.d/roozbeh
}

function fingerprint() {
    sudo gpasswd -a "$USER" input
    inst fprintd
    fprintd-enroll roozbeh -f "right-index-finger"
    fprintd-enroll roozbeh -f "left-index-finger"
    fprintd-list roozbeh
    # in casy of any issue:
    # \rm -rf /var/lib/fprint

    # add "auth    sufficient    pam_fprintd.so" to first of these files:
    # /etc/pam.d/xfce4-screensaver
    # /etc/pam.d/sudo
    # /etc/pam.d/system-local-login
}

function cloud() {
    inst kubectl kubectx openshift-client-bin helm
    inst nats-cli stern pgcli mycli iredis redis
    nats --completion-script-zsh >"$HOME/.zsh/completions/_nats"
    helm plugin install https://github.com/databus23/helm-diff

    oc krew install neat
    # export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
}

function touchpad() {
    sudo gpasswd -a "$USER" input
    newgrp input
    inst ruby libinput ruby-fusuma xdotool
    gsettings set org.gnome.desktop.peripherals.touchpad send-events enabled || true
    # https://github.com/iberianpig/fusuma/blob/main/README.md
    # place in: /etc/systemd/system/fusuma@.service
    # sudo systemctl --user daemon-reload
    # sudo systemctl --uesr restart fusuma.service
    # sudo systemctl --user status fusuma.service

    mkdir -p "$HOME/.config/systemd/user/"
    cp "$FILES_DIR/fusuma.service" "$HOME/.config/systemd/user/"
}

function laptop() {
    sudo pacman -Rns power-profiles-daemon
    systemctl mask power-profiles-daemon.service
    systemctl stop power-profiles-daemon.service

    inst tlp ethtool powertop gnome-power-manager
    sudo systemctl enable tlp.service
    sudo systemctl start tlp.service

    sudo tlp-stat -s

    sudo systemctl restart tlp.service

    gnome-power-statistics

    # inst tlpui
    #
    # GRUB_CMDLINE_LINUX="amdgpu.dcdebugmask=0x10"
    # sudo grub-mkconfig -o /boot/grub/grub.cfg
}

# intel wifi backend
# solve suspend issue
# https://wiki.archlinux.org/title/NetworkManager#Using_iwd_as_the_Wi-Fi_backend
function iwd() {
    inst iwd wireless-regdb
    sudo tee /etc/NetworkManager/conf.d/wifi-backend.conf <<-EOF
		[device]
		wifi.scan-rand-mac-address=no
		wifi.backend=iwd
	EOF
    sudo systemctl disable wpa_supplicant
    # delete all saved networks
    nmcli --fields UUID,TIMESTAMP-REAL con show | grep never | awk '{print $1}' | while read line; do nmcli con delete uuid "$line"; done
    # then check systemctl status iwd and NetworkManager
}

function disable-beep() {
    # permanently
    sudo tee /etc/modprobe.d/nobeep.conf <<-EOF
		blacklist pcspkr
		blacklist snd_pcsp
	EOF
    # just this time:
    sudo rmmod pcspkr || true
    sudo rmmod snd_pcsp || true
}

function ai() {
    inst uv yq

    # mods (only chat)
    inst mods

    # agent from mods creators
    inst crush-bin

    # agent: similar to crush
    inst opencode-bin

    # Claude code
    inst claude-code

    # llm
    uv tool install llm
    uvx llm install -U llm-openrouter

    # fabric
    (
        curl -fsSL https://raw.githubusercontent.com/danielmiessler/fabric/main/scripts/installer/install.sh | bash
        mkdir -p "$HOME/.config/fabric"
        touch "$HOME/.config/fabric/.env"
        /usr/bin/fabric --setup # use openrouter

        # fabric -l (list prompts)
        # fabric -L (list models)
        # fabric -U (upgrade prompts from remote)
    )
}

function gnome() {
    # disable annoying "window is ready" notification
    # https://superuser.com/questions/644850/disable-window-is-ready-notification-in-gnome-shell
    # install: https://extensions.gnome.org/extension/1007/window-is-ready-notification-remover/
    # OR
    gsettings set org.gnome.desktop.wm.preferences auto-raise 'true'
    gsettings set org.gnome.desktop.wm.preferences focus-new-windows 'smart'
}

function run() {
    pre_install
    aur_helper
    compilers
    terminal_full
    neovim_new
    bluetooth
    desktop_packages
    desktop_packages_extra
    fonts
    ta
    cpp_devel
    python_devel
    #zsh_atuin
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
