#!/bin/bash

function install_vim_config {
	echo "Installing vim config.."
	ln -s ~/dotfiles/vimrc ~/.vimrc
  ln -s ~/dotfiles/vim ~/.vim
}

function install_git {
  ln -s ~/dotfiles/gitconfig ~/.gitconfig
  ln -s ~/dotfiles/githelpers ~/.githelpers
}

function install_zsh {
  ln -s ~/dotfiles/zshrc ~/.zshrc
  ln -s ~/dotfiles/zprofile ~/.zprofile
  ln -s ~/dotfiles/zsh_aliases ~/.zsh_aliases
  ln -s ~/dotfiles/zsh_functions ~/.zsh_functions
}

function install_antigen {
	curl -L git.io/antigen > $HOME/.antigen.zsh
}
function install_vim_plugins {
  cd ~/dotfiles/vim/bundle
  git clone https://github.com/jiangmiao/auto-pairs 
  git clone https://github.com/jlanzarotta/bufexplorer.git 
  git clone https://github.com/itchyny/calendar.vim 
  git clone https://github.com/vim-scripts/mru.vim 
  git clone https://github.com/scrooloose/nerdtree 
  git clone https://github.com/scrooloose/nerdcommenter 
  git clone https://github.com/SirVer/ultisnips 
  git clone https://github.com/tpope/vim-surround 
  git clone https://github.com/maxbrunsfeld/vim-yankstack 
  git clone https://github.com/mikewest/vimroom 
  git clone https://github.com/guns/xterm-color-table.vim 
  cd ~
}
function install_command_t {
  cd ~/dotfiles/vim/bundle
  git clone https://github.com/wincent/command-t
  cd command-t/ruby/command-t/ext/command-t
  ruby extconf.rb
  make
  cd ~
}
function install_vim_syntax {
	echo "Installing vim syntax.."
	echo "TODO"
}


install_antigen
install_git
install_zsh
install_vim_config
install_vim_plugins
install_command_t
install_vim_syntax
