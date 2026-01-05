#!/bin/bash
# Pull secrets from 1Password
# Requires: 1Password CLI configured and authenticated

VAULT="macbook_setup"

echo "Restoring secrets from 1Password..."

# Create directories
mkdir -p ~/.keys
mkdir -p ~/.aws

# --- AWS Credentials ---
echo "Writing ~/.aws/credentials..."
if op read "op://$VAULT/aws_credentials/credentials" &>/dev/null; then
    op read "op://$VAULT/aws_credentials/credentials" > ~/.aws/credentials
    chmod 600 ~/.aws/credentials
    echo "  - AWS credentials restored"
else
    echo "  - Warning: AWS credentials not found in 1Password"
fi

echo "Writing ~/.aws/config..."
if op read "op://$VAULT/aws_credentials/config" &>/dev/null; then
    op read "op://$VAULT/aws_credentials/config" > ~/.aws/config
    chmod 600 ~/.aws/config
    echo "  - AWS config restored"
else
    # Create default config
    cat > ~/.aws/config << 'EOF'
[default]
region = us-east-1
output = json
EOF
    echo "  - AWS config created with defaults"
fi

# --- EC2/SSH Keys ---
echo "Restoring EC2 keys to ~/.keys/..."

for key in "playbox-prod-infra" "little-leaps-strapi" "playbox-dev-infra"; do
    if op read "op://$VAULT/$key/private_key" &>/dev/null; then
        op read "op://$VAULT/$key/private_key" > ~/.keys/${key}.pem
        chmod 400 ~/.keys/${key}.pem
        echo "  - ${key}.pem restored"
    else
        echo "  - Warning: ${key}.pem not found in 1Password"
    fi
done

# --- SSH Config ---
echo "Writing ~/.ssh/config..."
mkdir -p ~/.ssh
chmod 700 ~/.ssh
if op read "op://$VAULT/ssh_config/config" &>/dev/null; then
    op read "op://$VAULT/ssh_config/config" > ~/.ssh/config
    chmod 600 ~/.ssh/config
    echo "  - SSH config restored"
else
    echo "  - Warning: SSH config not found in 1Password"
fi

echo ""
echo "Secrets restoration complete!"
