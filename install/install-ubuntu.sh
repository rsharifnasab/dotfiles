sudo apt update
sudo apt upgrade

sudo apt install vim-gtk3 btop acpi stow \
    lsd git zsh vlc chromium python-is-python \
    oathtool npm cargo aria2 curl gnupg \
    spotify-client zoxide rg silversearcher-ag jq yq moreutils \
    ncal

mkdir -p ~/.zsh/completions

# kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

mkdir -p ~/.local/bin/
ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
# If you want to open text files and images in kitty via your file manager also add the kitty-open.desktop file
cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
# Update the paths to the kitty and its icon in the kitty desktop file(s)

sed -i "s|Icon=kitty|Icon=$(readlink -f ~)/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
sed -i "s|Exec=kitty|Exec=$(readlink -f ~)/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
# Make xdg-terminal-exec (and hence desktop environments that support it use kitty)
echo 'kitty.desktop' >~/.config/xdg-terminals.list

# nerdfont
curl -fsSL https://raw.githubusercontent.com/getnf/getnf/main/install.sh | bash
echo "24,25" | getnf

# neovim
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim python3-pynvim python3-venv python3-socks python3-requests luarocks
sudo npm install -g neovim
apt install ruby ruby-dev npm

gem install neovim
nvim --headless "+echo has('ruby')" +q # verify
sudo npm install -g neovim

# zed
curl -f https://zed.dev/install.sh | sh

# docker
curl -fsSL https://get.docker.com -o /tmp/get-docker.sh
bash /tmp/get-docker.sh

# teams
sudo mkdir -p /etc/apt/keyrings
sudo wget -qO /etc/apt/keyrings/teams-for-linux.asc https://repo.teamsforlinux.de/teams-for-linux.asc
echo "Types: deb
URIs: https://repo.teamsforlinux.de/debian/
Suites: stable
Components: main
Signed-By: /etc/apt/keyrings/teams-for-linux.asc
Architectures: amd64" | sudo tee /etc/apt/sources.list.d/teams-for-linux-packages.sources
sudo apt update
sudo apt install teams-for-linux

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
apt install tmux

# go latest version
#curl -sL -o ~/bin/gimme https://raw.githubusercontent.com/travis-ci/gimme/master/gimme
#chmod +x ~/bin/gimme
#gimme stable

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
# mv oc kubectl ~/bin/

kubectl completion zsh >~/.zshrc/completions/_kubectl
oc completion zsh >~/.zshrc/completions/_oc

# helm
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
helm completion zsh >~/.zsh/completions/_helm
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

# stern
go install github.com/stern/stern@latest

# nats-cli
go install github.com/nats-io/natscli/nats@latest

# image magick
sudo apt install imagemagick

# fd find
sudo apt install fd-find

# TODO
# windows-hello style login: https://github.com/boltgolt/howd
# atuin history?
