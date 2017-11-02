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
export ANDROID_HOME=/Users/igolden/Library/Android/sdk 						# android sdk path
export PKG_CONFIG_PATH=/opt/local/lib/pkgconfig:$PKG_CONFIG_PATH  # pkg_config
export PATH=/usr/local/opt/opencv3/bin:$PATH											# opencv3

# alias support
source ~/.zsh_aliases

# Add terminal colors, grep clors
export TERM='xterm-color'																					# terminal colors
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

eval "$(hub alias -s)" 																						# hub as github aliases

source ~/.zsh_functions	 																					# source our .zsh_functions

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local									# source a local .zshrc.local if it exists
[[ -f ~/.travis/travis.sh ]] && source ~/.travis/travis.sh 				# added by travis gem, sources travis

# call all functions
init_antigen
init_chruby 
