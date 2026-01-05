#!/bin/bash
# Pull secrets from 1Password
# Requires: 1Password CLI configured and authenticated

set +e  # Don't exit on errors - we handle them gracefully

VAULT="macbook_setup"

# Helper function to restore a secret with retry logic
restore_secret() {
    local op_path="$1"
    local dest="$2"
    local perms="$3"
    local max_attempts=3
    local attempt=1

    while [[ $attempt -le $max_attempts ]]; do
        if op read "$op_path" > "$dest" 2>/dev/null; then
            chmod "$perms" "$dest"
            echo "  - $(basename "$dest") restored"
            return 0
        fi
        if [[ $attempt -lt $max_attempts ]]; then
            echo "  - Attempt $attempt failed, retrying..."
            sleep 1
        fi
        ((attempt++))
    done

    echo "  - Warning: Failed to restore $(basename "$dest") after $max_attempts attempts"
    rm -f "$dest"  # Clean up empty/partial file
    return 1
}

echo "Restoring secrets from 1Password..."

# Create directories
mkdir -p ~/.keys
mkdir -p ~/.aws

# --- AWS Credentials ---
echo "Writing ~/.aws/credentials..."
restore_secret "op://$VAULT/aws_credentials/credentials" ~/.aws/credentials 600

echo "Writing ~/.aws/config..."
if ! restore_secret "op://$VAULT/aws_credentials/config" ~/.aws/config 600; then
    # Create default config if restore failed
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
    restore_secret "op://$VAULT/$key/private_key" ~/.keys/${key}.pem 400
done

# --- SSH Config ---
echo "Writing ~/.ssh/config..."
mkdir -p ~/.ssh
chmod 700 ~/.ssh
restore_secret "op://$VAULT/ssh_config/config" ~/.ssh/config 600

echo ""
echo "Secrets restoration complete!"
exit 0  # Always exit successfully
