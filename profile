alias ls="ls -wG"

#function parse_git_branch {
#  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
#  echo "("${ref#refs/heads/}")"
#}

function parse_git_dirty {
    [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
}

function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

MYUSER="cnhacktnt"
RED="\[\033[0;31m\]"
PINK="\[\033[31;1m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
CYAN="\[\033[1;36m\]"
MAGNETA="\[\033[0;35m\]"

export PS1="$GREEN\u\[\033[0m\]@$MAGNETA\h\[\033[0m\]$YELLOW\$(if [ \$(whoami) == \"$MYUSER\" ]; then parse_git_branch; fi)\[\033[0m\]:$PINK\w\n$CYAN\342\214\230\[\033[0m\] "
