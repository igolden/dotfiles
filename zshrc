setopt promptsubst
setopt EXTENDED_GLOB
autoload -U promptinit
promptinit
prompt igolden

export PATH=/opt/local/bin:/opt/local/sbin:$HOME/local/bin:$PATH
export PATH=$PATH:/usr/local/git/bin/
export MANPATH=/opt/local/share/man:$MANPATH
export PATH=/usr/local/sbin:/usr/local/bin:${PATH}
export PATH="$HOME/bin:$PATH"
export PKG_CONFIG_PATH="/opt/local/lib/pkgconfig:$PKG_CONFIG_PATH"
autoload -U compinit
compinit

# Utilities
alias ls='ls -G'
alias ll='ls -lG'
alias c="clear"
alias vup="vagrant up"
alias vupp="vagrant up --provision"
alias vs="vagrant ssh"
alias vp="vagrant provision"
alias rn="react-native"
# md5sum
alias md5='md5 -r'
alias md5sum='md5 -r'
alias rncc='watchman watch-del-all && rm -rf node_modules && npm install && npm start -- --reset-cache'

# Unbreak broken, non-colored terminal
export TERM='xterm-color'
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
alias :w="You're not in Vim"
alias diff=colordiff

# Personal Commands
alias es='exec $SHELL'
alias b='bundle install --path .bundle/gems --binstubs .bundle/bin'
alias be='bundle exec'
alias grh="git reset --hard"
alias push="git push origin HEAD"
alias pr="git pull-request"
alias tree='git log --graph --pretty=format:'\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset'\'' --abbrev-commit --date=relative'

# Jekyll Commands
alias js='jekyll serve'
alias jb='jekyll build'

alias gti='git'
alias vmi='vim'
alias cim='vim'

# Sys Admin Commands
alias duh='du -csh'
alias dimage='du -hc *.png'

#start/stop postgres
alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

# Init
alias gsetup="git init && git aa && git ci -m 'initial'"

# Commit
alias gc="git ci -m $1"
alias gac="git aa && git ci -m $1"

# Push
alias gp="git push origin master"
alias gph="git push heroku"

# Remote
alias gro="git remote add origin"
alias bbro="git remote add origin git@bitbucket:igolden/$1"


# Arduino
alias pf="platformio platforms"
alias bbro="git remote add origin git@bitbucket:igolden/$1"
alias ngrok="/Applications/ngrok"

alias agno="vim .antigen/repos/https-COLON--SLASH--SLAcd .antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh.git/themes/"

function gacp() {
    gac $1 
    gpo
}

function gach() {
    gac $1 
    gph
}

if [ -f ~/.git-completion.zsh ]; then
  . ~/.git-completion.zsh
fi

source "$HOME/dotfiles/.antigen/antigen.zsh"
antigen bundle robbyrussell/oh-my-zsh lib/
antigen bundle git
antigen-theme https://gist.github.com/b13f9353014327743137 igolden
antigen-apply

#chruby
source /usr/local/opt/chruby/share/chruby/chruby.sh
chruby 2.3.0
#Hub Alias
eval "$(hub alias -s)"
alias todo="bundle exec todo"



[[ -f ~/.localrc ]] && . ~/.localrc
