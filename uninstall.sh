#!/bin/bash

function uninstall {
  # install vim
  rm -rf ~/.vim
  rm ~/.vimrc
  # uninstall git preferences
  rm ~/.gitconfig
  rm ~/.githelpers
  # uninstall zsh
  rm ~/.zshrc
  rm ~/.zprofile
  rm ~/.zsh_aliases
  rm ~/.zsh_functions
}

uninstall
