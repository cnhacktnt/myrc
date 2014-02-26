alias ls="ls -wG"

function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
CYAN="\[\033[1;36m\]"
MAGNETA="\[\033[0;35m\]"

export PS1="$GREEN\u\[\033[0m\]@$MAGNETA\h\[\033[0m\]$YELLOW\$(if [ \$(whoami) == \"cnhacktnt\" ]; then parse_git_branch; fi)\[\033[0m\]:$path\n$CYAN\342\214\230\[\033[0m\] "
