# Roozbeh dotfiles

You are visiting my dotfiles repository.

I'm actually newbie in writing Dotfiles. if you want to help me, I appreciate!

I collected all of my config files here to apply them after each re-install and keep them sync between my systems.


## How to use
1. Make sure you have Arch Linux.
2. Clone the repo in proper place with this command:
```bash
 curl -sL https://raw.githubusercontent.com/rsharifnasab/dotfiles/master/install/dotfiles_cloner.sh | bash
```
2. open `install/post_install.sh` and comment/uncomment sections in `run`
3. run `install/post_install.sh` with bash
4. check out `docs` folder, for example there is a cheatsheet for after installation steps. [+](./docs/after_install.txt) or general useful commands [+](./docs/main.md).

## Configurations
+ Neovim: config files is in `.config/nvim`. Plugins are being managed by packer. Install new plugins with `:PackerSync` and `:PackerCompile`. 
+ Devicons depends on setting terminal font to `ubuntu font`
+ Zsh config files are in `.zshrc`. zsh select a random theme from `zsh_favlist`. don't panic!
+ Bash and Zsh use common aliases (in `.aliases`
+ emacs: using doom mode. (config is in `.doom.d`)
+ Trying to keep Vim minimal. no plugins or special settings. just `.vimrc` 
+ safe-rm: send removed items to trash! Also protect from accidental remove all files!
+ kitty is my favorite termial.
+ there are some tiny scripts in `bin` which I find useful. they are in `$PATH` too.
+ `Templates` contain different code templates which I may use.

