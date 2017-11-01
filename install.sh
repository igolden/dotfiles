#!/bin/bash

function setup_git {
  ln -s ~/dotfiles/gitconfig ~/.gitconfig
  ln -s ~/dotfiles/githelpers ~/.githelpers
}

setup_git
