# Roozbeh dotfiles

here I will share my important dot files
I'm actually newbie in writing Dotfiles, if you want to help me, I appreciate

## How to use

1. clone this repo in '~/proj/dotfiles' and cd to it.
2. install packages with `./install-first.sh`
3. update (pull) from repository with `./bootstrap.sh`
4. Cheat sheet is available in `help.txt`, `vim-cheat.txt` and `emacs-cheat`

## Configurations

1. Neovim: config files is in `./.config/nvim`. Plugins are being managed by vim-plug. Install plugins with `:PlugInstall`. Using devicons depends on setting terminal font to `ubuntu font`
2. Zsh: recently migrated to Zsh. config files are in `./zshrc`
3. emacs: using doom mode. view `./doom.d`
4. Vim: using simple configs from the neovim configs
5. fish: fish config (in `./.config/fish`) have some good functions and customizations but let it be there and use some posix compliant shell
6. safe-rm: send removed items to trash! Also protect from accidental remove all files!
