#!/bin/bash
# 1Password setup - requires manual authentication

echo ""
echo "==========================================="
echo "  ACTION REQUIRED: 1Password Setup"
echo "==========================================="
echo ""

# Loop until op whoami succeeds
while true; do
    # Step 1: Prompt to login to 1Password app
    echo "Step 1: Open and sign in to 1Password app"
    echo "  - Go to Settings > Developer"
    echo "  - Enable 'Integrate with 1Password CLI'"
    echo ""
    open -a "1Password"
    read -p "Press Enter when 1Password is ready..." </dev/tty

    # Step 2: Run op signin
    echo ""
    echo "Step 2: Signing in to 1Password CLI..."
    op signin 2>/dev/null
    read -p "Press Enter to continue..." </dev/tty

    # Step 3: Check op whoami
    echo ""
    echo "Verifying 1Password CLI..."
    if op whoami &>/dev/null; then
        echo "1Password CLI configured successfully!"
        op whoami
        break
    else
        echo ""
        echo "ERROR: 1Password CLI not configured properly."
        echo "Let's try again..."
        echo ""
    fi
done
