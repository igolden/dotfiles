#!/bin/bash
# Install GUI applications via Homebrew casks
# Run separately after bootstrap: source ~/dotfiles/scripts/07-apps.sh

echo "Installing GUI applications..."

brew install --cask \
  iterm2 \
  alfred \
  google-chrome \
  firefox \
  docker-desktop \
  slack \
  visual-studio-code \
  android-studio \
  figma \
  obsidian \
  bruno \
  rectangle

echo ""
echo "GUI apps installed!"
echo ""
echo "Post-install notes:"
echo "  - Open Android Studio and complete SDK setup"
echo "  - Add Android paths to ~/.bashrc.local (see template)"
echo "  - Configure Alfred, Rectangle, etc."
