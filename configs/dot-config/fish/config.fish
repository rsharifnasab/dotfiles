# set vim as default text editor
set -gx EDITOR nvim
set -gx VISUAL nvim
#bind \t '__fzf_complete'

set SAFE_RM '/usr/bin/safe-rm'
if test -f "$SAFE_RM"
alias rm="$SAFE_RM"
end


# please clear my terminal
alias clean='clear'
alias CLEAN='clear'
alias CLEAR='clear'
alias زمثشق='clear'


alias em-term='emacsclient -a ""'
alias em='emacsclient -n -c -a ""'
alias :q=exit


alias glog='git log --graph --oneline --decorate --abbrev-commit'
alias junit="cp -r ~/pro*/*utils/junit_test_runner/* ."

#export PATH=$PATH:~/bin/


