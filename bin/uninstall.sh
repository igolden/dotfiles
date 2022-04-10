#!/bin/bash

function uninstall {
  # uninstall antigen
  rm -rf ~/.antigen
  rm ~/.antigen.zsh
  # uninstall vim
  rm -rf ~/.vim/bundle/*
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
