setopt promptsubst
autoload -U promptinit
promptinit
prompt grb
source /usr/local/opt/chruby/share/chruby/chruby.sh

export PATH=/opt/local/bin:/opt/local/sbin:$HOME/local/bin:$PATH
export PATH=$PATH:/usr/local/git/bin/
export MANPATH=/opt/local/share/man:$MANPATH
export PATH=/usr/local/sbin:/usr/local/bin:${PATH}
export PATH="$HOME/bin:$PATH"

autoload -U compinit
compinit

# Unbreak broken, non-colored terminal
export TERM='xterm-color'
alias ls='ls -G'
alias sshi='ssh goldenav@indywebco.com'
alias ll='ls -lG'
alias duh='du -csh'
alias b='bundle install --path .bundle/gems --binstubs .bundle/bin'
alias grh="git reset --hard"
alias c="clear"
alias gl='git log --graph --pretty=format:'\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset'\'' --abbrev-commit --date=relative'
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"

# Unbreak history
export HISTSIZE=100000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

export EDITOR=vi
set -o emacs
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

export WORDCHARS='*?[]~&;!$%^<>'

export ACK_COLOR_MATCH='red'

alias r=rails
alias sr="screen -r"
alias :q="You're not in Vim"
alias :w="You're not in VIM"
alias be='bundle exec --path .bundle/gems --binstubs .bundle/bin'
alias diff=colordiff
# eval "$(hub alias -s)"

# igolden Commands
alias es='exec $SHELL'
alias js='jekyll serve'
alias jb='jekyll build'

#start/stop postgres

alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'


# Git Commands
#
#  Generate Rake File
alias grf='git clone git@bitbucket.org:igolden/hosting_rake.git . && rm -rf .git && echo "Deploy with: rake deploy" && echo "Update with: rake update"'

# Init
alias gsetup="git init && git aa && git ci -m 'initial'"

# Commit
alias gc="git ci -m $1"
alias gac="git aa && git ci -m $1"
alias gacj="jekyll build && gac"

# Push
alias gp="git push origin master"
alias gph="git push heroku"

# Remote
alias gro="git remote add origin"
alias bbro="git remote add origin git@bitbucket:igolden/$1"


function gacjp() {
    jekyll build
    gac $1 
    gpo
}
function gacp() {
    gac $1 
    gpo
}

function gach() {
    gac $1 
    gph
}

function bbcn {
  gsetup;
  if [ "$1" != "" ]; then
    bb create $1;
    bbro;
   else
      echo "bb repo not created"
  fi
}

chruby ruby-2.1.3
eval "$(hub alias -s)"
[[ -f ~/.localrc ]] && . ~/.localrc
