setopt promptsubst
setopt EXTENDED_GLOB
autoload -U compinit

# edit-command-line
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# bind search history to arrow keys 
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# setup PATH
export PATH=/opt/local/bin:/opt/local/sbin:$HOME/local/bin:$PATH 	# setup local sbin 
export PATH=$PATH:/usr/local/git/bin/															# setup git path export MANPATH=/opt/local/share/man:$MANPATH	
export PATH=/usr/local/sbin:/usr/local/bin:${PATH}								# local sbin
export PATH=$HOME/bin:$PATH																				# home dir bin
export PATH=$PATH:/usr/local/cuda/bin															# cuda executable support
export PATH="$HOME/.fastlane/bin:$PATH"


export WORKSPACE="$HOME/workspace"
export EFS="$WORKSPACE/85supply"
export IGOLDEN="$WORKSPACE/igolden"

export NOTES="$WORKSPACE/notes"


function note {
  vim ~/workspace/notes/$1.md
}

export TODAY_PATH="$WORKSPACE/today.md"
export TOMORROW_PATH="$WORKSPACE/today.md"

export DOTFILES_PATH="$HOME/dotfiles"

# android
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export JAVA_HOME="/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home"


export PKG_CONFIG_PATH=/opt/local/lib/pkgconfig:$PKG_CONFIG_PATH  # pkg_config
export PATH=/usr/local/opt/opencv3/bin:$PATH											# opencv3
export PATH=$HOME/go/bin:$PATH											              # gobin
export PATH=$HOME/Library/Python/2.7/bin:$PATH

export TERM='xterm-256color'																					# terminal colors
export LSCOLORS='ExGxBxDxCxEgEdxbxgxcxd'													# ls -al colors
export GREP_OPTIONS='--color' 																		# grep colors

export ACK_COLOR_MATCH='green'																		# when ack matches, make it green

# saving command line history 
export HISTSIZE=100000																						# save last 100K lines in zsh_history
export HISTFILE="$HOME/.zsh_history"															# save to ~/.zsh_history
export SAVEHIST=$HISTSIZE 																				# set the history

# editor support
export EDITOR=vim 																								# because vim
export WORDCHARS='*?[]~&;!$%^<>'																	# how zsh handles vim wordchars
export ANTIGEN_LOG=~/antigen.log																	# antigen logging

# tab completion with git 
if [[ -f ~/.git-completion.zsh ]]; then
	. ~/.git-complete.zsh 
fi


## antigen is a zsh tool bundler, and manages themes.
## init antigen in the home dir, download theme
function init_antigen {
	source $HOME/antigen.zsh
	antigen use oh-my-zsh 	
	antigen bundle git
  antigen bundle zsh-users/zsh-syntax-highlighting
	antigen theme https://gist.github.com/igolden/b13f9353014327743137 igolden 
  antigen apply
}


## chruby is used to "change rubies" and works great
## with ruby-install. Install your ruby, set your
## global ruby here, so it's not your system ruby.
function init_chruby {
  source /usr/local/opt/chruby/share/chruby/chruby.sh
  chruby 3.0.2
}


# call all functions
init_antigen
init_chruby 

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh


DISABLE_AUTO_TITLE="true"

#export PATH="$(brew --prefix qt@5.5)/bin:$PATH"

# added by travis gem
[ -f /Users/igolden/.travis/travis.sh ] && source /Users/igolden/.travis/travis.sh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/igolden/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/igolden/node_modules/tabtab/.completions/slss.zsh
export PATH="/usr/local/opt/go@1.11/bin:$PATH"



source ~/.zsh_aliases

[ -f "/Users/igolden/.shopify-app-cli/shopify.sh" ] && source "/Users/igolden/.shopify-app-cli/shopify.sh"
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local									# source a local .zshrc.local if it exists
[[ -f ~/.travis/travis.sh ]] && source ~/.travis/travis.sh 				# added by travis gem, sources travis

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
