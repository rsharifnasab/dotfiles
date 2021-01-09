## apps cheat sheet

-   meld (diff)
-   catfish (gui file search)
-   variety (time-base wallaper change)
-   xfburn (cd DVD tool)
-   dictionary
-   usb stick formatter
-   usb image writer
-   thunar (file manager)
-   ncdu (terminal disk space usage monitor)

## commands

-   clear yay cache -> `yay -Sc`
-   clear pip cache -> `rm -r .cache/pip`
-   curl cheet.sh/git # or any other command
-   tir -> time.ir in shell

## cmd tools

-   od, od -a -> hexdump
-   xdg-open -> double click
-   alsamixer -> sound setting
-   fd -> find
-   fzf -> find files (fuzzy fle finder)
-   ag -> grep in text files
-   http -> cli http client like curl

## FZF

-   fzf (in terminal)
-   \ + tab (in neovim)
-   fe -> select fish whith FZF and edit it later
-   fkill -> select a process to kill with FZF

-   ctrl-t -> find file with preview
-   ctrl-r -> find in recent commands
-   ctrl-o -> find file to open
-   ctrl-g -> select and open with defaul deitor

-   alt-c -> select folder to cd

## shell shortcuts

-   ctrl c -> clear the line
-   ctrl l -> clear terminal
-   ctrl w -> delete last word
-   ctrl u -> delete to beginning

## zsh specific shotcuts

-   esc -> enter vi mode

## git cheet

-   git log --abbrev-commit --pretty=oneline
-   git blame -c somefile.txt

-   git tag -> show all tags
-   git tag "V1.0" [commit sha]

-   git diff HEAD -> what is changed after last commit
-   git diff HEAD^ -> what is changed after commit before last commit
-   git diff HEAD~3 -> what is changed after 3 commit before last commit

-   git diff --staged -> which change stagged after last commit
-   git reset somefile -> unstage changes
-   git checkout -- somefile -> revert to last commit for somefile

-   git branch -> show current branches
-   git branch branchname -> create new branch branchname
-   git checkout branchname -> go to branchname
-   git merge branchname -> merge branchname to current branch
-   git brach -d branchname -> delete branchname

-   git stash -> save current uncommited but staged works in a stash and revert back to lastest commit
-   git stash -u -> track and untracked files
-   git stash -a -> track and untracked and ignored files
-   git stash apply -> revert to last stash
-   git stash list, git stash show -> list of my stashes

-   git commit --amend -> change last commit
-   git commit --amend -m 'new commit message for last commit'

-   git clean -ix -> delete ignored files
-   git clean -i -> delete untracked files (not changed)
    --> replace i with f -> not interactive, force
    --> use d -> dry-run : just test, don't do anything

# trash

-   folder `/home/roozbeh/.local/share/Trash/files`
