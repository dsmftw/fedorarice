# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
#NPMPATH="$HOME/.npm-global"
#PATH="$NPMPATH/bin:$HOME/.local/bin:$HOME/bin:$PATH"
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# Custom prompt
if [[ "$TERM" =~ 256color ]]; then
    export PS1='\[\e[1;31m\][\[\e[1;33m\]\u\[\e[0;37m\]@\[\e[1;32m\]\h \[\e[0;35m\]\w\[\e[1;31m\]]\[\e[1;37m\]\$ \[\e[0m\]'
else
    export PS1='[\u@\h \w]\$ '
fi

# Aliases
cp () { command cp -v "$@" ; }
mv () { command mv -v "$@" ; }
rm () { command rm -v "$@" ; }
rmdir () { command rmdir -v "$@" ; }
[[ $(type -t ls) == "alias" ]] && unalias ls
ls () { command ls -F -h -v --color=auto --time-style=long-iso "$@" ; }
alias ll='ls -l'
alias la='ls -lA'
alias vimrc='vim $HOME/dotfiles/vimrc'
alias bashrc='vim $HOME/dotfiles/bashrc'
alias dosmth='$(find ~/dotfiles/colorscripts/ -type f | shuf -n 1)'
alias cddots='cd $HOME/dotfiles'
alias cdcode='cd $HOME/codebase'

# Bash history
export HISTFILESIZE=-1
export HISTSIZE=-1
export HISTTIMEFORMAT="[%F %T] "
export HISTIGNORE="history*:pwd:ls:ll:la:cd"
export HISTCONTROL=ignoreboth:erasedups
shopt -s histappend

# Get weather for city/airport
function weather() { curl -s wttr.in/"$*"?lang=ru | grep -vE "feature|Follow"; }

# Postgres activity monitor; pass args: username hostname
#pgactivity () { $HOME/python-2.7.12/bin/pg_activity -U "$1" -h "$2" -d postgres; }

# Delete provided range from history
rmhist () {
  start=$1
  end=$2
  count=$(( end - start ))
  while [ $count -ge 0 ] ; do
    history -d $start
    ((count--))
  done
}

# Count numfiles numdirs
numfiles () {
  fcnt="$(find $1 -maxdepth 1 -type f | wc -l)";
  echo "$fcnt files in $1";
}

# Count number of lines in all files in curr dir
numlines () { ( find ./ -type f -name "*.$1" -print0 | xargs -0 cat ) | wc -l; }

# Super extractor
extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)  tar xjf $1      ;;
      *.tar.gz)   tar xzf $1      ;;
      *.bz2)      bunzip2 $1      ;;
      *.rar)      7za x $1        ;;
      *.7z)       7zr x $1        ;;
      *.gz)       gunzip $1       ;;
      *.tar)      tar xf $1       ;;
      *.tbz2)     tar xjf $1      ;;
      *.tgz)      tar xzf $1      ;;
      *.zip)      unzip $1        ;;
      *.Z)        uncompress $1   ;;
      *)          echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Base16 Shell
#BASE16_SHELL="$HOME/.config/base16-shell/"
#[ -n "$PS1" ] && \
#    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
#        eval "$("$BASE16_SHELL/profile_helper.sh")"

