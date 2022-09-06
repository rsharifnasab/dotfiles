# Roozbeh dotfiles

You are visiting my dotfiles repository.

I'm actually newbie in writing Dotfiles. If you want to help me, I appreciate!


## How to use
1. Make sure you have (and love) Arch Linux.
2. Clone repo with this command:
```bash
 curl -sL https://raw.githubusercontent.com/rsharifnasab/dotfiles/master/install/dotfiles_cloner.sh | bash
```
This would clone the current repository to "~/proj/dotfiles"
2. Open `install/post_install.sh` in your editor of choice and comment/uncomment sections in `run`. 
3. Run `install/post_install.sh` with bash. You can also source it manually in bash and run functions interactively.
4. Check out `docs` folder fo more information. For example there is a cheatsheet for "after installation steps". [+](./docs/after_install.txt) and general useful commands [+](./docs/main.md).

## Configurations
+ Neovim: config files is in `.config/nvim`. Plugins are being managed by packer. After modifying `plugins.lua`, Let Packer download them with `:PackerSync`.
+ Zsh config files are in `.zshrc`. Zsh would select a random theme from `zsh_favlist` in each run, So please don't panic!
+ Bash and Zsh use common aliases (in `.aliases`
+ Emacs uses Doom mode. (configs are in `.doom.d`)
+ Trying to keep Vim config minimal. No plugins or cool themes. Just a simple `.vimrc` 
+ safe-rm: send removed items to trash! Also protect from accidental remove all files!
+ kitty is my favorite termial.
+ there are some tiny scripts in `bin` which I find useful. They are in `$PATH` too.
+ `Templates` contain different code templates which I may use.
+ I'm managing dotfiles with stow. This means config files are kept in dotfiles folder but a symlink to them is in home folder. So be careful:
    + You should back up and delete your old config files before first sync or otherwise stow throws an error.
    + DO NOT delete or move or rename dotfiles folder. If you do so, All configs become unavailable.

