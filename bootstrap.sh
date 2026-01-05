#!/bin/bash
# Bootstrap script for fresh macOS install
# Run with: curl -fsSL https://raw.githubusercontent.com/igolden/dotfiles/main/bootstrap.sh | bash

set -e

DOTFILES_DIR="$HOME/dotfiles"
DOTFILES_REPO="https://github.com/igolden/dotfiles.git"

echo "========================================"
echo "  macOS Bootstrap Script"
echo "========================================"
echo ""

# Check if running on macOS
if [[ "$(uname)" != "Darwin" ]]; then
    echo "Error: This script is for macOS only"
    exit 1
fi

# Step 1: Xcode Command Line Tools
echo "[1/10] Installing Xcode Command Line Tools..."
if ! xcode-select -p &>/dev/null; then
    echo ""
    echo "==========================================="
    echo "  ACTION REQUIRED: Xcode CLI Tools"
    echo "==========================================="
    echo ""
    echo "A dialog will appear to install Xcode Command Line Tools."
    echo "Please click 'Install' and wait for completion."
    echo ""
    xcode-select --install
    read -p "Press Enter after installation completes..."
else
    echo "Xcode CLI Tools already installed, skipping..."
fi

# Step 2: Install Homebrew
echo "[2/10] Installing Homebrew..."
if ! command -v brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "Homebrew already installed, skipping..."
fi

# Step 3: Install git (needed to clone dotfiles)
echo "[3/10] Installing git..."
brew install git

# Step 4: Clone dotfiles repo
echo "[4/10] Cloning dotfiles..."
if [[ -d "$DOTFILES_DIR" ]]; then
    echo "Dotfiles already exist at $DOTFILES_DIR"
    cd "$DOTFILES_DIR"
    git pull origin main || git pull origin master || true
else
    # Use HTTPS since SSH isn't set up yet
    git clone https://github.com/igolden/dotfiles.git "$DOTFILES_DIR"
    cd "$DOTFILES_DIR"
fi

# Step 5: Install core tools and 1Password
echo "[5/10] Installing core tools..."
source "$DOTFILES_DIR/scripts/01-homebrew.sh"

# Step 6: 1Password auth (manual)
echo "[6/10] 1Password setup..."
source "$DOTFILES_DIR/scripts/02-1password.sh"

# Step 7: Pull secrets from 1Password
echo "[7/10] Restoring secrets..."
source "$DOTFILES_DIR/scripts/03-secrets.sh"

# Step 8: SSH key + GitHub
echo "[8/10] SSH key setup..."
source "$DOTFILES_DIR/scripts/04-ssh-github.sh"

# Step 9: Shell + Runtime setup
echo "[9/10] Shell and runtime setup..."
source "$DOTFILES_DIR/scripts/05-shell.sh"
source "$DOTFILES_DIR/scripts/06-node.sh"
source "$DOTFILES_DIR/scripts/08-ruby.sh"
source "$DOTFILES_DIR/scripts/07-apps.sh"

# Switch dotfiles remote to SSH now that SSH is configured
echo "Switching dotfiles remote to SSH..."
cd "$DOTFILES_DIR"
git remote set-url origin git@github.com:igolden/dotfiles.git

# Step 10: Run healthcheck
echo "[10/10] Running Healthcheck..."
echo ""
source "$DOTFILES_DIR/healthcheck.sh"

echo ""
echo "========================================"
echo "  Bootstrap Complete!"
echo "========================================"
echo ""
echo "Next steps:"
echo "  1. Restart your terminal (or run: source ~/.bashrc)"
echo "  2. Install Xcode from App Store, then run: sudo xcodebuild -license accept"
echo "  3. Open Android Studio and complete SDK setup"
echo ""
