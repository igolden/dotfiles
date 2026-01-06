#!/bin/bash
# Bootstrap script for fresh macOS install
# Run with: git clone https://github.com/igolden/dotfiles.git ~/dotfiles && cd ~/dotfiles && ./bootstrap.sh

DOTFILES_DIR="$HOME/dotfiles"
DOTFILES_REPO="https://github.com/igolden/dotfiles.git"

# Run a step resiliently - continue even if it fails
run_step() {
    local step_name="$1"
    local script_path="$2"

    if source "$script_path"; then
        echo "$step_name completed successfully"
    else
        echo ""
        echo "Warning: $step_name had errors but continuing..."
        echo ""
    fi
}

echo "========================================"
echo "  macOS Bootstrap Script"
echo "========================================"
echo ""

# Check if running on macOS
if [[ "$(uname)" != "Darwin" ]]; then
    echo "Error: This script is for macOS only"
    exit 1
fi

# Check if dotfiles repo is cloned
if [[ ! -f "$DOTFILES_DIR/bootstrap.sh" ]]; then
    echo "Error: Please clone dotfiles first:"
    echo "  git clone https://github.com/igolden/dotfiles.git ~/dotfiles"
    echo "  cd ~/dotfiles && ./bootstrap.sh"
    exit 1
fi
cd "$DOTFILES_DIR"

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
    read -p "Press Enter after installation completes..." </dev/tty
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

# Step 4: Install core tools
echo "[4/10] Installing core tools..."
run_step "Core tools installation" "$DOTFILES_DIR/scripts/01-homebrew.sh"

# Step 5: 1Password auth (manual)
echo "[5/10] 1Password setup..."
run_step "1Password setup" "$DOTFILES_DIR/scripts/02-1password.sh"

# Step 6: Pull secrets from 1Password
echo "[6/10] Restoring secrets..."
run_step "Secrets restoration" "$DOTFILES_DIR/scripts/03-secrets.sh"

# Step 7: SSH key + GitHub
echo "[7/10] SSH key setup..."
run_step "SSH key setup" "$DOTFILES_DIR/scripts/04-ssh-github.sh"

# Step 8: Shell + Runtime setup
echo "[8/10] Shell and runtime setup..."
run_step "Shell setup" "$DOTFILES_DIR/scripts/05-shell.sh"
run_step "Node.js setup" "$DOTFILES_DIR/scripts/06-node.sh"
run_step "Ruby setup" "$DOTFILES_DIR/scripts/08-ruby.sh"
run_step "Apps installation" "$DOTFILES_DIR/scripts/07-apps.sh"

# Step 9: macOS settings
echo "[9/10] Configuring macOS settings..."
run_step "macOS settings" "$DOTFILES_DIR/scripts/09-macos.sh"

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
