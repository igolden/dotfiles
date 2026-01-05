#!/bin/bash
# 1Password setup - requires manual authentication

echo ""
echo "==========================================="
echo "  ACTION REQUIRED: 1Password Setup"
echo "==========================================="
echo ""
echo "Please complete the following steps:"
echo ""
echo "  1. Open 1Password app (it should have launched)"
echo "  2. Sign in to your account"
echo "  3. Go to Settings > Developer"
echo "  4. Enable 'Integrate with 1Password CLI'"
echo ""
echo "==========================================="
echo ""

# Open 1Password
open -a "1Password"

read -p "Press Enter when 1Password is ready..." </dev/tty

# Verify 1Password CLI is working
echo "Verifying 1Password CLI..."
if op account list &>/dev/null; then
    echo "1Password CLI is configured!"
else
    echo "Error: 1Password CLI not configured properly"
    echo "Please ensure you enabled CLI integration in 1Password settings"
    exit 1
fi
