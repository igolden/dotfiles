#!/bin/bash
# Node.js setup via fnm

echo "Setting up Node.js..."

# Initialize fnm for this session
eval "$(fnm env)"

# Install LTS version
echo "Installing Node.js LTS..."
fnm install --lts
fnm default lts-latest

# Verify installation
echo "Node version: $(node --version)"
echo "npm version: $(npm --version)"

# Install global packages
echo "Installing global npm packages..."
npm install -g @anthropic-ai/claude-code wrangler

echo "Node.js setup complete!"
