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
        ttf-firacode-nerd pyenv ruby uv npm tree-sitter-cli luarocks
    git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv || true

    gem install neovim

    pyenv virtualenv nvim
    pyenv shell nvim
    pyenv activate nvim
    uv pip install pynvim
    sudo npm install -g neovim
}

function terminal_full() {
    inst zsh moreutils zoxide \
        kitty ttf-fira-code ttf-firacode-nerd \
        tree tldr fd nnn \
        the_silver_searcher \
        just usbutils pciutils \
        bat fzf \
        awesome-terminal-fonts python-tqdm \
        nano xed tmux jcal btop tokei aria2 acpi tty-clock \
        ncdu qrencode viu \
        jq yq \
        speedtest-cli bind \
        fastfetch pfetch-rs-bin \
        tre-command-bin gping rm-improved-bin \
        guake git-extras

}

function terminal_extra() {
    inst lazygit gitui \
        hyperfine mtr httpie \
        source-highlight sd
}

function internet() {
    # set nekobox path to  /usr/share/sing-box
    # https://github.com/MatsuriDayo/nekoray/issues/389
    inst proxychains-ng xray-bin sing-box-bin jdk-openjdk \
        nekoray-bin sing-geoip-common sing-geoip-db sing-geoip-rule-set \
        sing-geosite-common sing-geosite-db sing-geosite-rule-set

    # check internet connectivity status
    go install -ldflags="-s -w" -v github.com/jesusprubio/up@latest
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
    inst eslint tidy stylelint yarn
    sudo npm -g install js-beautify
}

function haskell_devel() {
    inst ghc-static stack cabal-install hlint stylish-haskell \
        elixir
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
        ntfs-3g pacman-contrib inetutils lxrandr \
        zip unzip unrar xarchiver engrampa p7zip \
        variety flameshot redshift \
        ipython \
        vlc shotwell telegram-desktop meld thunar obs-studio \
        gparted obsidian
    # prevent rm from deleting important files
    sudo npm i -g safe-rm

    # remove this package to let chromium open!
    # pacman -Rns xf86-video-intel package
}

function desktop_packages_extra() {
    # pdf manipulation
    inst pdftk poppler

    inst typora marp-cli-bin marktext-bin logseq-desktop-bin termius fswatch

    # seahorse to change keyring password for skype
    inst skypeforlinux-bin gnome-keyring seahorse \
        mission-center thunderbird

    inst pandoc-bin
    inst galaxybudsclient-bin
    inst spotify-launcher

    # fabric
    (
        cd /tmp || exit
        curl -L https://github.com/danielmiessler/fabric/releases/latest/download/fabric-linux-amd64 >fabric && chmod +x fabric && ./fabric --version
        \sudo mv ./fabric /usr/bin/
        /usr/bin/fabric --setup # use openrouter
        # fabric -l (list prompts)
        # fabric -L (list models)
        # fabric -U (upgrade prompts from remote)
        # fabric -u "google.com" -p pattern_name
        # fabric -y "youtube.com" -p pattern_name
    )
}

function fonts() {
    # install persian font (from here: https://github.com/fzerorubigd/persian-fonts-linux)
    printf "37\nyes\n" |
        bash -c "$(curl -fsSL https://raw.githubusercontent.com/fzerorubigd/persian-fonts-linux/master/farsifonts.sh)"
}

function zsh_full() {
    inst zsh fzf

    chsh -s "$(which zsh)"

    #install fzf for zsh and other
    #git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    #~/.fzf/install

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
    inst uv pyenv
    git clone https://github.com/pyenv/pyenv-virtualenv.git "$(pyenv root)/plugins/pyenv-virtualenv"

    (
        pyenv virtualenv apps
        pyenv shell apps
        pyenv activate apps

        uv pip install --upgrade pip pylint ipython
        uv pip install --upgrade numpy pandas matplotlib plotly networkx pillow
        uv pip install pyqt5 # for matplotlib

        uv pip install mypy pandas-stubs data-science-types # python static type check (work with ale)
        #mypy --install-types

        inst python-pylint python-black pyright autopep8 ruff

    )
    #inst python-pylint-venv python-pipenv python-pytest \
    # python-rednose python-pytest autopep8
}

function micro() {
    curl https://getmic.ro | bash
    \sudo "\mv" ./micro /usr/bin/micro
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

    echo "add this script to /etc/local/bin/docker"
    sudo mkdir -p /etc/local/bin
    sudo tee /etc/local/bin/docker <<EOF
#!/bin/bash
if [ "$(id -u)" -eq 0 ]; then
	/usr/bin/docker "$@"
else
	sudo /usr/bin/docker "$@"
fi
EOF
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
    inst nats-cli stern pgcli
    nats --completion-script-zsh >~/.oh-my-zsh/completions/_nats
    helm plugin install https://github.com/databus23/helm-diff

    oc krew install neat
    # Add to path:
    # export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
}

function redshift_install() {
    inst redshift
    # place in: /etc/systemd/system/redsh@.service
    # sudo systemctl daemon-reload
    # sudo systemctl enable redsh@roozbeh.service
    # sudo systemctl restart redsh@roozbeh.service
    # sudo systemctl status redsh@roozbeh.service
    tee /dev/null <<EOF
    tee /dev/null <<EOF
[Unit]
Description=Redshift display colour temperature adjustment
Documentation=http://jonls.dk/redshift/
After=display-manager.service

[Service]
Environment=DISPLAY=:0
ExecStart=/home/roozbeh/bin/redsh
Restart=always
User=%i

[Install]
WantedBy=default.target
EOF

}

function touchpad() {
    sudo gpasswd -a "$USER" input
    newgrp input
    inst ruby libinput ruby-fusuma xdotool
    gsettings set org.gnome.desktop.peripherals.touchpad send-events enabled || true
    # https://github.com/iberianpig/fusuma/blob/main/README.md
    # place in: /etc/systemd/system/fusuma@.service
    # sudo systemctl daemon-reload
    # sudo systemctl enable fusuma@roozbeh.service
    # sudo systemctl restart fusuma@roozbeh.service
    # sudo systemctl status fusuma@roozbeh.service
    tee /dev/null <<EOF
[Unit][Unit]
Description=Fusuma multitouch gesture recognizer

[Service]
Type=simple
Environment="DISPLAY=:0"
User=%i
ExecStart=/usr/bin/fusuma
KillMode=process
Restart=on-failure

[Install]
WantedBy=graphical.target
EOF

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
    inst mods gum yq

    # aider
    pyenv virtualenv aider2
    pyenv activate aider2
    uv pip install aider-install
    aider-install

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
    zsh_full
    terminal_full
    neovim_new
    bluetooth
    desktop_packages
    desktop_packages_extra
    fonts
    ta
    cpp_devel
    python_devel
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
