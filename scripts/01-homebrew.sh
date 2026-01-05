#!/bin/bash
# Install Homebrew packages

echo "Installing CLI tools..."
brew install git gh neovim ripgrep jq wget htop tmux fzf bash-completion@2 || true

echo "Installing runtimes..."
brew install fnm python@3.12 go chruby ruby-install || true

echo "Installing project tools..."
brew install ffmpeg yt-dlp postgresql@14 redis watchman docker docker-compose awscli || true

echo "Installing 1Password..."
brew install --cask --force 1password || true
brew install 1password-cli || true

echo "Homebrew packages installed!"
