# Apps & Commands Cheat Sheet

## 1. Apps
- meld -> diff tool
- catfish -> GUI file search
- variety -> time-based wallpaper change
- xfburn -> CD/DVD tool
- dictionary
- usb stick formatter
- usb image writer
- thunar -> file manager
- ncdu -> terminal disk-usage monitor

## 2. Commands
- clear paru cache -> `paru -Sc`
- clear pip cache -> `rm -r .cache/pip`
- keep only last 100MB of systemd logs -> `sudo journalctl --vacuum-size=100M`
- clear go cache -> `go clean -cache -modcache`
- empty trash -> `\rm -r ~/.local/share/Trash/files/*`

- show installed package information -> `paru -Ps`
- sort packages by size -> `pacgraph -c`

- cheat sheet (any command) -> `curl cheat.sh/git`
- simple docs -> `tldr command`
- time.ir -> `tir`
- xfce editor with good Persian support -> `xed`

## 3. CLI Tools
- `od`, `od -a` -> hexdump
- `xdg-open` -> open file (double-click behavior)
- `alsamixer` -> sound settings
- `fd` -> find
- `fzf` -> fuzzy file finder
- `ag` -> grep inside text
- `http` -> CLI HTTP client
- `auto-xflux` -> f.lux automation
- `nnn` -> terminal file manager
- `n` -> open nnn (Ctrl+G closes with cd)
- `bandwhich` -> show bandwidth usage per app
- `zellij` -> tmux alternative
- `ncdu` & `diskonaut` -> disk usage inspection

## 4. FZF Usage
- terminal -> `fzf`
- neovim -> `\` + `Tab`

Shortcuts / helpers:
- `fkill` -> kill selected process
- `fe` -> select file with fzf and edit
- `fd` -> find dir with fzf and cd into it
- `fh` -> repeat command from history
- `in` -> install paru package
- `re` -> remove paru package
- `nn` -> same as nnn but with fzf + cd

Neovim:
- `**<Tab>` -> fuzzy file select

Shell:
- `cd **<Tab>` -> cd into selected folder
- `kill -9 **<Tab>` -> kill selected process
- `Ctrl-T` -> paste selected files/dirs
- `Ctrl-R` -> fuzzy history search
- `Alt-C` -> cd into selected directory

## 5. Shell Shortcuts
- Ctrl+C -> clear line
- Ctrl+L -> clear terminal
- Ctrl+W -> delete last word
- Ctrl+U -> delete to start

## 6. Zsh Shortcuts
- `z folder_name` -> jump instantly to folder

## 7. Git Cheat Sheet
Logs & blame:
- `git log --abbrev-commit --pretty=oneline`
- `git blame -c somefile.txt`

Tags:
- `git tag` -> list tags
- `git tag "V1.0" <sha>` -> create tag

Diffs:
- `git diff HEAD` -> changes after last commit
- `git diff HEAD^` -> changes before last commit
- `git diff HEAD~3` -> changes three commits before

Staging / reverting:
- `git diff --staged` -> staged changes
- `git reset somefile` -> unstage file
- `git checkout -- somefile` -> restore file

Branches:
- `git branch` -> list branches
- `git branch name` -> create branch
- `git checkout name` -> switch branch
- `git merge name` -> merge into current
- `git branch -d name` -> delete branch

Stash:
- `git stash` -> stash staged changes
- `git stash -u` -> include untracked
- `git stash -a` -> include ignored
- `git stash apply` -> apply last stash
- `git stash list`, `git stash show` -> inspect stash

Amend:
- `git commit --amend` -> modify last commit
- `git commit --amend -m "msg"` -> change last commit message

Clean:
- `git clean -ix` -> delete ignored
- `git clean -i` -> delete untracked
    - replace `i` with `f` -> force
    - use `d` -> dry-run

## 8. Trash
- path -> `/home/roozbeh/.local/share/Trash/files`

## 9. Kitty
- key bindings -> https://sw.kovidgoyal.net/kitty/overview/
- configurations -> https://sw.kovidgoyal.net/kitty/conf/
- change theme -> `kitten themes`
