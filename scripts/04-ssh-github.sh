#!/bin/bash
# Generate SSH key and add to GitHub

SSH_KEY="$HOME/.ssh/id_ed25519"

echo ""
echo "==========================================="
echo "  SSH Key + GitHub Setup"
echo "==========================================="
echo ""

# Check if SSH key already exists
if [[ -f "$SSH_KEY" ]]; then
    echo "SSH key already exists at $SSH_KEY"
    read -p "Generate new key anyway? (y/N) " -n 1 -r </dev/tty
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Using existing key..."
    else
        rm -f "$SSH_KEY" "$SSH_KEY.pub"
    fi
fi

# Generate new key if needed
if [[ ! -f "$SSH_KEY" ]]; then
    echo "Generating new SSH key..."
    ssh-keygen -t ed25519 -C "ian@iangolden.com" -f "$SSH_KEY" -N ""
    echo "SSH key generated!"
fi

# Start ssh-agent and add key
eval "$(ssh-agent -s)"
ssh-add "$SSH_KEY"

# Copy public key to clipboard
echo ""
echo "Copying public key to clipboard..."
cat "$SSH_KEY.pub" | pbcopy
echo ""
echo "==========================================="
echo "  ACTION REQUIRED: Add SSH Key to GitHub"
echo "==========================================="
echo ""
echo "Your public key has been copied to clipboard!"
echo ""
echo "Opening GitHub SSH settings..."
echo ""

# Open GitHub SSH settings
open "https://github.com/settings/ssh/new"

read -p "Press Enter after adding the key to GitHub..." </dev/tty

# Verify GitHub connection
echo ""
echo "Testing GitHub connection..."
ssh -o StrictHostKeyChecking=accept-new -T git@github.com 2>&1 || true

echo ""
echo "SSH key setup complete!"
