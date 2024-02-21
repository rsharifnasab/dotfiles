#!/usr/bin/bash

export FILTER_BRANCH_SQUELCH_WARNING=1
git filter-branch --env-filter '
old_email="rsharifnasab@gmail.com"
correct_email="maedehdehghanam@gmail.com"
correct_name="Maedeh Dehghan"

an="$GIT_AUTHOR_NAME"
am="$GIT_AUTHOR_EMAIL"
cn="$GIT_COMMITTER_NAME"
cm="$GIT_COMMITTER_EMAIL"

if [ "$GIT_COMMITTER_EMAIL" = "$old_email" ]
then
    cn="$correct_name"
    cm="$correct_email"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$old_email" ]
then
    an="$correct_name"
    am="$correct_email"
fi

export GIT_AUTHOR_NAME="$an"
export GIT_AUTHOR_EMAIL="$am"
export GIT_COMMITTER_NAME="$cn"
export GIT_COMMITTER_EMAIL="$cm"
' --tag-name-filter cat -- --branches --tags

# https://www.git-tower.com/learn/git/faq/change-author-name-email/
# https://stackoverflow.com/questions/750172/how-do-i-change-the-author-and-committer-name-email-for-multiple-commits/9491696#9491696
