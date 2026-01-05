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

# Step 1: Install Homebrew
echo "[1/8] Installing Homebrew..."
if ! command -v brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "Homebrew already installed, skipping..."
fi

# Step 2: Install git (needed to clone dotfiles)
echo "[2/8] Installing git..."
brew install git

# Step 3: Clone dotfiles repo
echo "[3/8] Cloning dotfiles..."
if [[ -d "$DOTFILES_DIR" ]]; then
    echo "Dotfiles already exist at $DOTFILES_DIR"
    cd "$DOTFILES_DIR"
    git pull origin main || git pull origin master || true
else
    # Use HTTPS since SSH isn't set up yet
    git clone https://github.com/igolden/dotfiles.git "$DOTFILES_DIR"
    cd "$DOTFILES_DIR"
fi

# Step 4: Install core tools and 1Password
echo "[4/8] Installing core tools..."
source "$DOTFILES_DIR/scripts/01-homebrew.sh"

# Step 5: 1Password auth (manual)
echo "[5/8] 1Password setup..."
source "$DOTFILES_DIR/scripts/02-1password.sh"

# Step 6: Pull secrets from 1Password
echo "[6/8] Restoring secrets..."
source "$DOTFILES_DIR/scripts/03-secrets.sh"

# Step 7: SSH key + GitHub
echo "[7/8] SSH key setup..."
source "$DOTFILES_DIR/scripts/04-ssh-github.sh"

# Step 8: Shell + Node setup
echo "[8/8] Shell and runtime setup..."
source "$DOTFILES_DIR/scripts/05-shell.sh"
source "$DOTFILES_DIR/scripts/06-node.sh"

# Switch dotfiles remote to SSH now that SSH is configured
echo "Switching dotfiles remote to SSH..."
cd "$DOTFILES_DIR"
git remote set-url origin git@github.com:igolden/dotfiles.git

# Final: Run healthcheck
echo ""
echo "========================================"
echo "  Running Healthcheck"
echo "========================================"
source "$DOTFILES_DIR/healthcheck.sh"

echo ""
echo "========================================"
echo "  Bootstrap Complete!"
echo "========================================"
echo ""
echo "Next steps:"
echo "  1. Restart your terminal (or run: source ~/.bashrc)"
echo "  2. Install GUI apps: source ~/dotfiles/scripts/07-apps.sh"
echo "  3. Open Android Studio and complete SDK setup"
echo ""
