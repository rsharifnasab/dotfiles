## apps cheat sheet

- meld (diff)
- catfish (gui file search)
- variety (time-base wallaper change)
- xfburn (cd DVD tool)
- dictionary
- usb stick formatter
- usb image writer
- thunar (file manager)
- ncdu (terminal disk space usage monitor)

## commands

- clear paru cache -> `paru -Sc`
- clear pip cache -> `rm -r .cache/pip`
- keep only last 100MB log files in systemd -> `sudo journalctl --vacuum-size=100M`
- clear go cache -> `go clean -cache -modcache`
- empty trash -> `\rm -r ~/.local/share/Trash/files/*`

- show information about installed pakcages -> `paru -Ps`
- sort packages by size -> `pacgraph -c`

- `curl cheet.sh/git` # or any other command
- `tldr command` -> help like man pages, but simple
- `tir` -> time.ir in shell
- `xed` -> xfce editor with good persian support

## cmd tools

- od, od -a -> hexdump
- xdg-open -> double click
- alsamixer -> sound setting
- fd -> find
- fzf -> find files (fuzzy fle finder)
- ag -> grep in text files
- http -> cli http client like curl
- auto-xflux (f.lux automatic)
- nnn -> beautiful file manager in terminal
- n -> open nnn, ctrl g to close with cd
- bandwhich: which app is using bandwidth
- zellij: good tmux alternative
- ncdu & diskonaut -> check hdd usage

## FZF

- fzf (in terminal)
- \ + tab (in neovim)

- fkill -> select a process to kill with FZF
- fe -> selec with fzf and edit
- fd -> fudn dir with fzf and cd to it
- fh -> history repeat
- in -> install paru package
- re -> remove paru package
- nn -> same as nnn but with fzf and cd
- nvim `**<TAB>` -> open fzf for file choose
- cd `**TAB>` -> cd to fzf chosen folder
- kill -9 `**<TAB>` -> kill the fzf chosen process
- CTRL-T -> Paste the selected files and directories onto the command-line
- CTRL-R -> Paste the selected command from history onto the command-line
- ALT-C - cd into the selected directory

## shell shortcuts

- ctrl c -> clear the line
- ctrl l -> clear terminal
- ctrl w -> delete last word
- ctrl u -> delete to beginning

## zsh specific shotcuts

- z some_folder -> instant cd to folder name

## git cheet

- git log --abbrev-commit --pretty=oneline
- git blame -c somefile.txt

- git tag -> show all tags
- git tag "V1.0" [commit sha]

- git diff HEAD -> what is changed after last commit
- git diff HEAD^ -> what is changed after commit before last commit
- git diff HEAD~3 -> what is changed after 3 commit before last commit

- git diff --staged -> which change stagged after last commit
- git reset somefile -> unstage changes
- git checkout -- somefile -> revert to last commit for somefile

- git branch -> show current branches
- git branch branchname -> create new branch branchname
- git checkout branchname -> go to branchname
- git merge branchname -> merge branchname to current branch
- git brach -d branchname -> delete branchname

- git stash -> save current uncommited but staged works in a stash and revert back to lastest commit
- git stash -u -> track and untracked files
- git stash -a -> track and untracked and ignored files
- git stash apply -> revert to last stash
- git stash list, git stash show -> list of my stashes

- git commit --amend -> change last commit
- git commit --amend -m 'new commit message for last commit'

- git clean -ix -> delete ignored files
- git clean -i -> delete untracked files (not changed)
  --> replace i with f -> not interactive, force
  --> use d -> dry-run : just test, don't do anything

# trash

- folder `/home/roozbeh/.local/share/Trash/files`

# kitty

- key bindings [+](https://sw.kovidgoyal.net/kitty/overview/)
- configurations [+](https://sw.kovidgoyal.net/kitty/conf/)
- change theme: `kitten themes`

# Docker

- Docker in arch uses iran server repository for bypassing sanctions.
- Docker in mac uses orbstack currently.
