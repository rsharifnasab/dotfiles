# Roozbeh's Dotfiles

You are visiting my dotfiles repository.

## How to use

+ Make sure you have (and love) Arch Linux.

+ Install `curl` and `git` if you don't have it already.

+ Clone repo with this command:

```bash
 curl -sL https://raw.githubusercontent.com/rsharifnasab/dotfiles/master/install/dotfiles_cloner.sh | bash
```

This would clone the current repository to `~/proj/dotfiles`

+ Use `sync_home` script to symlinks configs from dotfiles repo to your home dir.

```bash
~/proj/dotfiles/configs/bin/sync_home
```

It would fails if any of the files (like `.bashrc`) exists. Delete them and try again.

+ Open `install/post_install.sh` in your editor of choice
and comment/uncomment sections in `run` and run it (Use at your own risk).

+ Run `install/post_install.sh` with bash.
You can also source it manually in bash and run functions interactively.

+ Check out the `docs` folder for more information.
For example, there is a cheat sheet for "after installation steps". [+](./docs/after_install.txt)
and general useful commands [+](./docs/main.md).

## Configurations

+ Neovim: Moved to [it's own repo](https://github.com/rsharifnasab/my-neovim.git)
+ All config files are in `configs/` dir, which is then symlinked to `~` with `sync_home`
+ Bash and Zsh use common aliases (in `.aliases.sh`)
+ The Vim config is minimal. No plugins or cool themes. Just a simple `.vimrc`.
+ safe-rm: send removed items to the trash instead of deleting them forever!
It also protects you from accidental deletion of all files!
+ Kitty is my favorite terminal emulator.
+ There are some tiny scripts in the `bin` dir,
which I find useful. They are in `$PATH` too.
+ `Templates` contain different code templates that I might use.
+ File are symlinked to `~` with Stow. This means config files
are kept in `dotfiles/configs` folder, but they are symlinked to
proper places in the home folder. So be careful:
  + You should back up and delete your old config files before first sync,
    or otherwise, stow throws an error.
  + DO NOT delete, move, or rename the dotfiles folder.
    If you do so, All configs become unavailable!
  + If you added a file or dir to the `dotfiles` dir,
    you should call `sync_home` in order to create symlinks in the home.
