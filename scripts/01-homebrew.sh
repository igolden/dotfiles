#!/bin/bash
# Install Homebrew packages

echo "Installing CLI tools..."
brew install git gh neovim ripgrep jq wget htop tmux fzf bash-completion@2

echo "Installing runtimes..."
brew install fnm python@3.12 go chruby ruby-install

echo "Installing project tools..."
brew install ffmpeg yt-dlp postgresql@14 redis watchman docker docker-compose awscli

echo "Installing 1Password..."
brew install --cask --force 1password
brew install 1password-cli

echo "Homebrew packages installed!"
