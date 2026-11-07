sudo apt update
sudo apt upgrade

sudo apt install vim-gtk3 btop acpi stow \
    lsd git zsh vlc chromium \
    oathtool npm cargo aria2 curl gnupg \
    zoxide ripgrep silversearcher-ag jq yq moreutils \
    ncal

mkdir -p "$HOME/.zsh/completions"

chsh -s $(which zsh)

# kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

mkdir -p "$HOME/.local/bin/"
ln -sf "$HOME/.local/kitty.app/bin/kitty" "$HOME/.local/kitty.app/bin/kitten" "$HOME/.local/bin/"
cp "$HOME/.local/kitty.app/share/applications/kitty.desktop" "$HOME/.local/share/applications/"
# If you want to open text files and images in kitty via your file manager also add the kitty-open.desktop file
cp "$HOME/.local/kitty.app/share/applications/kitty-open.desktop" "$HOME/.local/share/applications/"
# Update the paths to the kitty and its icon in the kitty desktop file(s)

sed -i "s|Icon=kitty|Icon=$(readlink -f "$HOME")/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" "$HOME/.local/share/applications/kitty"*.desktop
sed -i "s|Exec=kitty|Exec=$(readlink -f "$HOME")/.local/kitty.app/bin/kitty|g" "$HOME/.local/share/applications/kitty"*.desktop
# Make xdg-terminal-exec (and hence desktop environments that support it use kitty)
echo 'kitty.desktop' >"$HOME/.config/xdg-terminals.list"

# nerdfont
curl -fsSL https://raw.githubusercontent.com/getnf/getnf/main/install.sh | bash
echo "24,25" | getnf

# neovim
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim python3-pynvim python3-venv python3-socks python3-requests luarocks xclip
sudo npm install -g neovim
apt install ruby ruby-dev npm
cargo install --locked tree-sitter-cli

(
    curl -LsSf https://astral.sh/uv/install.sh | sh
    uv venv "$HOME/.venvs/nvim"
    source "$HOME/.venvs/nvim/bin/activate" && uv pip install pynvim
)

gem install neovim
nvim --headless "+echo has('ruby')" +q # verify
sudo npm install -g neovim

# zed
curl -f https://zed.dev/install.sh | sh

# docker
curl -fsSL https://get.docker.com -o /tmp/get-docker.sh
bash /tmp/get-docker.sh

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git "$HOME/.fzf"
"$HOME/.fzf/install"
apt install tmux

# go latest version
sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt update
sudo apt install golang-go

# kubernetes
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg

sudo mkdir -p -m 755 /etc/apt/keyrings
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.33/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
sudo chmod 644 /etc/apt/keyrings/kubernetes-apt-keyring.gpg # allow unprivileged APT programs to read this keyring

# oc and kubectl
curl https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-client-linux.tar.gz -o /tmp/oc.tar.gz
# ex /tmp/oc.tar.gz
# mv oc kubectl "$HOME/bin/"

kubectl completion zsh >"$HOME/.zsh/completions/_kubectl"
oc completion zsh >"$HOME/.zsh/completions/_oc"

# helm
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
helm completion zsh >"$HOME/.zsh/completions/_helm"
helm plugin install https://github.com/databus23/helm-diff

# db
sudo apt install mycli pgcli iredis
sudo add-apt-repository ppa:serge-rider/dbeaver-ce
sudo apt-get update
sudo apt-get install dbeaver-ce
sudo npm install -g redis-commander
# run redis-commander, then open localhost:8081

# safe-rm
sudo npm i -g safe-rm

# image magick
sudo apt install imagemagick

# fd instead of find
sudo apt install fd-find
ln -s $(which fdfind) ~/.local/bin/fd

# yazi
apt install ffmpeg 7zip jq poppler-utils fd-find ripgrep zoxide imagemagick
#then get binary from here https://github.com/sxyazi/yazi/releases

# opencode
curl -fsSL https://opencode.ai/install | bash

# claude code
curl -fsSL https://claude.ai/install.sh | bash

# spotify
sudo mkdir -p /etc/apt/keyrings
curl -sS https://download.spotify.com/debian/pubkey_5384CE82BA52C83A.asc |
    sudo gpg --dearmor --yes -o /etc/apt/keyrings/spotify.gpg

echo "deb [signed-by=/etc/apt/keyrings/spotify.gpg] https://repository.spotify.com stable non-free" |
    sudo tee /etc/apt/sources.list.d/spotify.list

sudo apt update
sudo apt install spotify-client

# misc terminal
apt install ncdu moreutils tmux guake tree nnn bat aria2 neofetch btop tre-command just tealdeer mtr httpie hyperfine jcal

# misc programs
apt install meld thunar obs-studio gnome-keyring

# TODO: element, telegram, proton-authenticator

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup install stable
rustup default stable
rustup component add clippy
rustup component add rustfmt
rustup component add rust-analysis rust-src

# Internet
( # xray
    sudo mkdir -p /usr/local/lib/xray
    cd /tmp || exit

    curl -fLo xray.zip \
        "https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-$(uname -m | sed -e 's/x86_64/64/' -e 's/aarch64/arm64-v8a/').zip"

    sudo unzip -o xray.zip -d /usr/local/lib/xray
    sudo install -m 755 /usr/local/lib/xray/xray /usr/local/bin/xray
    rm -f xray.zip
)
( # sing-box
    cd /tmp || exit
    curl -fLo sing-box.tar.gz \
        "https://github.com/SagerNet/sing-box/releases/latest/download/sing-box-$(curl -fsSL https://api.github.com/repos/SagerNet/sing-box/releases/latest | grep -oP '(?<="tag_name": ")[^"]+' | sed 's/^v//')-linux-amd64.tar.gz"

    tar -xzf sing-box.tar.gz
    sudo install -m 755 sing-box-*/sing-box /usr/local/bin/sing-box
    rm -rf sing-box.tar.gz sing-box-*
)
( # wireguard and openvpn
    sudo apt update
    sudo apt install wireguard wireguard-tools openvpn network-manager-openvpn network-manager-openvpn-gnome

    echo "deb [signed-by=/etc/apt/keyrings/openvpn.gpg] https://packages.openvpn.net/openvpn3/debian noble main" | sudo tee /etc/apt/sources.list.d/openvpn3.list
    sudo mkdir -p /etc/apt/keyrings/
    curl -fsSL https://packages.openvpn.net/packages-repo.gpg | sudo gpg --dearmor -o /etc/apt/keyrings/openvpn.gpg

    sudo apt update
    sudo apt instal openvpn3
)
