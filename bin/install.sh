#!/bin/bash

function install_vim_config {
	echo "Installing vim config.."
	ln -s $HOME/dotfiles/config/vimrc $HOME/.vimrc
  rm -rf $HOME/.vim
  ln -s $HOME/dotfiles/config/vim $HOME/.vim
}

function install_git {
  ln -s $HOME/dotfiles/config/gitconfig $HOME/.gitconfig
  ln -s $HOME/dotfiles/config/githelpers $HOME/.githelpers
}

function install_zsh {
  ln -s $HOME/dotfiles/config/zshrc $HOME/.zshrc
  ln -s $HOME/dotfiles/config/zprofile $HOME/.zprofile
  ln -s $HOME/dotfiles/config/zsh_aliases $HOME/.zsh_aliases
  ln -s $HOME/dotfiles/config/zsh_functions $HOME/.zsh_functions
}

function install_antigen {
	curl -L git.io/antigen > $HOME/antigen.zsh
}
function install_vim_plugins {
  mkdir -p $HOME/dotfiles/config/vim/bundle
  cd $HOME/dotfiles/config/vim/bundle
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
  git clone https://github.com/Xuyuanp/nerdtree-git-plugin.git 
  git clone https://github.com/prettier/vim-prettier.git 
  cd $HOME
}
function install_command_t {
  #cd $HOME/dotfiles/config/vim/bundle
  #git clone https://github.com/wincent/command-t
  cd command-t/ruby/command-t/ext/command-t
  ruby extconf.rb
  make
  cd $HOME
}
function install_vim_syntax {
	echo "Installing vim syntax.."
  cd $HOME/dotfiles/config/vim/bundle
  git clone https://github.com/fatih/vim-go 
  git clone https://github.com/rhysd/vim-crystal
  git clone https://github.com/rust-lang/rust.vim
  git clone https://github.com/keith/swift.vim
  git clone https://github.com/pangloss/vim-javascript
  git clone https://github.com/mxw/vim-jsx
  cd $HOME
}

function install_powerline_fonts {
  echo "Installing powerline fonts.."
  git clone https://github.com/powerline/fonts
  cd fonts/
  ./install.sh
}


#install_antigen
install_git
install_zsh
install_vim_config
install_vim_plugins
install_command_t
install_vim_syntax
