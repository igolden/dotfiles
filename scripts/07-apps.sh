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
  linear \
  bruno \
  rectangle || true

# iTerm2 Dynamic Profiles
DOTFILES_DIR="${DOTFILES_DIR:-$HOME/dotfiles}"
ITERM_PROFILES_DIR="$HOME/Library/Application Support/iTerm2/DynamicProfiles"
if [[ -f "$DOTFILES_DIR/config/iterm2/profiles.json" ]]; then
    echo "Setting up iTerm2 profiles..."
    mkdir -p "$ITERM_PROFILES_DIR"
    ln -sf "$DOTFILES_DIR/config/iterm2/profiles.json" "$ITERM_PROFILES_DIR/profiles.json"
    echo "  - iTerm2 profiles linked"
fi

echo ""
echo "GUI apps installed!"
echo ""
echo "Post-install notes:"
echo "  - Open Android Studio and complete SDK setup"
echo "  - Add Android paths to ~/.bashrc.local (see template)"
echo "  - Configure Alfred, Rectangle, etc."
echo "  - To sync iTerm2 profiles: export from Preferences > Profiles > Other Actions > Copy Profile as JSON"
echo "    Save to ~/dotfiles/config/iterm2/profiles.json (wrap in {\"Profiles\": [...]})"
