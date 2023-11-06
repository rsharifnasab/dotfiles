# Roozbeh's Dotfiles

You are visiting my dotfiles repository.

I'm actually a newbie in saving Dotfiles. If you want to help me, I appreciate it!


## How to use
1. Make sure you have (and love) Arch Linux.
2. Clone repo with this command:
```bash
 curl -sL https://raw.githubusercontent.com/rsharifnasab/dotfiles/master/install/dotfiles_cloner.sh | bash
```
This would clone the current repository to "~/proj/dotfiles"
2. Open `install/post_install.sh` in your editor of choice and comment/uncomment sections in `run` and run it (Use at your own risk). 
3. Run `install/post_install.sh` with bash. You can also source it manually in bash and run functions interactively.
4. Check out the `docs` folder for more information. For example, there is a cheat sheet for "after installation steps". [+](./docs/after_install.txt) and general useful commands [+](./docs/main.md).

## Configurations
+ Neovim: config files are in `.config/nvim`. Plugins are being managed by Packer (in `.config/nvim/packer.lua`). After modifying that, Let Packer download them with `:PackerSync`.
+ Zsh config files are in `.zshrc`. 
+ Bash and Zsh use common aliases (in `.aliases.sh`)
+ Emacs uses Doom mode. (configs are in `.doom.d`)
+ The Vim config is minimal. No plugins or cool themes. Just a simple `.vimrc`, but Neovim is so cool! 
+ safe-rm: send removed items to the trash instead of deleting them forever! It also protects you from accidental deletion of all files!
+ Kitty is my favorite terminal emulator.
+ There are some tiny scripts in the `bin` dir, which I find useful. They are in `$PATH` too.
+ `Templates` contain different code templates that I might use.
+ I'm managing dotfiles with Stow. This means config files are kept in `dotfiles/configs` folder, but they are symlinked to the proper places in the home folder. So be careful:
    + You should back up and delete your old config files before first sync, or otherwise, stow throws an error.
    + DO NOT delete, move, or rename the dotfiles folder. If you do so, All configs become unavailable!
    + If you added a file or dir to the `dotfiles` dir, you should call sync_home in order to create symlinks in the home.

