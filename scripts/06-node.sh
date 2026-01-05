#!/bin/bash
# Node.js setup via fnm

echo "Setting up Node.js..."

# Initialize fnm for this session
eval "$(fnm env)" 2>/dev/null || true

# Install LTS version if not already installed
if ! command -v node &>/dev/null; then
    echo "Installing Node.js LTS..."
    fnm install --lts
    fnm default lts-latest
else
    echo "Node.js already installed, skipping..."
fi

# Verify installation
echo "Node version: $(node --version)"
echo "npm version: $(npm --version)"

# Install global packages (|| true for idempotency)
echo "Installing global npm packages..."
npm install -g @anthropic-ai/claude-code wrangler || true

echo "Node.js setup complete!"
