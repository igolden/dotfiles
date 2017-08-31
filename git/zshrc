setopt promptsubst
setopt EXTENDED_GLOB

autoload -U compinit

# edit-command-line
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# PATH
export PATH=/opt/local/bin:/opt/local/sbin:$HOME/local/bin:$PATH
export PATH=$PATH:/usr/local/git/bin/
export MANPATH=/opt/local/share/man:$MANPATH
export PATH=/usr/local/sbin:/usr/local/bin:${PATH}
export PATH="$HOME/bin:$PATH"
export PATH=$PATH:/usr/local/cuda/bin
export PATH=/Users/igolden/source/linux/pitools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian/bin:$PATH
export ANDROID_HOME=/Users/igolden/Library/Android/sdk
export PKG_CONFIG_PATH="/opt/local/lib/pkgconfig:$PKG_CONFIG_PATH"
export PATH="/usr/local/opt/opencv3/bin:$PATH"

source "$HOME/.zsh_aliases"
source "$HOME/.zsh_functions"

# Unbreak broken, non-colored terminal
export TERM='xterm-color'
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"

# Long History
export HISTSIZE=100000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

# Editors
export EDITOR=vim
set -o emacs

# ?
export WORDCHARS='*?[]~&;!$%^<>'
export ACK_COLOR_MATCH='red'


if [ -f ~/.git-completion.zsh ]; then
  . ~/.git-completion.zsh
fi

function init_antigen {
  source "$HOME/dotfiles/antigen/antigen.zsh"
  antigen bundle robbyrussell/oh-my-zsh lib/
  antigen bundle git
  antigen-theme https://gist.github.com/b13f9353014327743137 igolden &> /dev/null
}


#chruby
function init_chruby {
  source /usr/local/opt/chruby/share/chruby/chruby.sh
  chruby 2.4.1
}

#Hub Alias
eval "$(hub alias -s)"

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local


# added by travis gem
[ -f /Users/igolden/.travis/travis.sh ] && source /Users/igolden/.travis/travis.sh

# function calls
init_antigen
init_chruby
