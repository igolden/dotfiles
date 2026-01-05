#!/bin/bash
# Shell setup - install bashrc and set default shell

DOTFILES_DIR="${DOTFILES_DIR:-$HOME/dotfiles}"

echo "Setting up shell..."

# Backup existing bashrc if present
if [[ -f "$HOME/.bashrc" ]]; then
    echo "Backing up existing ~/.bashrc to ~/.bashrc.backup"
    cp "$HOME/.bashrc" "$HOME/.bashrc.backup"
fi

# Copy bashrc
echo "Installing ~/.bashrc..."
cp "$DOTFILES_DIR/config/bashrc" "$HOME/.bashrc"

# Copy aliases
echo "Installing ~/.aliases.bash..."
cp "$DOTFILES_DIR/config/aliases.bash" "$HOME/.aliases.bash"

# Copy gitconfig
echo "Installing ~/.gitconfig..."
cp "$DOTFILES_DIR/config/gitconfig" "$HOME/.gitconfig"

# Copy githelpers
echo "Installing ~/.githelpers..."
cp "$DOTFILES_DIR/config/githelpers" "$HOME/.githelpers"

# Copy gemrc
echo "Installing ~/.gemrc..."
cp "$DOTFILES_DIR/config/gemrc" "$HOME/.gemrc"

# Setup nvim config
echo "Installing ~/.config/nvim/..."
mkdir -p "$HOME/.config"
if [[ -d "$HOME/.config/nvim" && ! -L "$HOME/.config/nvim" ]]; then
    if [[ ! -d "$HOME/.config/nvim.backup" ]]; then
        echo "Backing up existing nvim config..."
        mv "$HOME/.config/nvim" "$HOME/.config/nvim.backup"
    else
        echo "Backup already exists, removing old nvim config..."
        rm -rf "$HOME/.config/nvim"
    fi
fi
cp -r "$DOTFILES_DIR/config/nvim" "$HOME/.config/nvim"

# Set bash as default shell (if not already)
if [[ "$SHELL" != "/bin/bash" ]]; then
    echo "Setting bash as default shell..."
    sudo chsh -s /bin/bash "$USER" </dev/tty
    echo "Default shell changed to bash (restart terminal to apply)"
else
    echo "Bash is already the default shell"
fi

echo "Shell setup complete!"
