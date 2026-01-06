#!/bin/bash
# Workspace setup - create directories and clone repos from config

DOTFILES_DIR="${DOTFILES_DIR:-$HOME/dotfiles}"
CONFIG_FILE="$DOTFILES_DIR/config/workspace.json"

echo ""
echo "==========================================="
echo "  Workspace Setup"
echo "==========================================="
echo ""

if [[ ! -f "$CONFIG_FILE" ]]; then
    echo "Warning: workspace.json not found, skipping..."
    exit 0
fi

# Get workspace root (expand ~)
WORKSPACE_ROOT=$(jq -r '.root' "$CONFIG_FILE" | sed "s|^~|$HOME|")
echo "Workspace root: $WORKSPACE_ROOT"
mkdir -p "$WORKSPACE_ROOT"

# Process structure recursively
process_item() {
    local parent_path="$1"
    local item="$2"

    local name=$(echo "$item" | jq -r '.name')
    local type=$(echo "$item" | jq -r '.type')
    local full_path="$parent_path/$name"

    if [[ "$type" == "directory" ]]; then
        if [[ -d "$full_path" ]]; then
            echo "  [exists] $full_path"
        else
            echo "  [create] $full_path"
            mkdir -p "$full_path"
        fi

        # Process children if any
        local children=$(echo "$item" | jq -c '.children // []')
        if [[ "$children" != "[]" ]]; then
            echo "$children" | jq -c '.[]' | while read -r child; do
                process_item "$full_path" "$child"
            done
        fi

    elif [[ "$type" == "repo" ]]; then
        local repo=$(echo "$item" | jq -r '.repo')

        if [[ -d "$full_path/.git" ]]; then
            echo "  [exists] $full_path (repo: $repo)"
        else
            echo "  [clone]  $full_path <- git@github.com:$repo.git"
            git clone "git@github.com:$repo.git" "$full_path"
        fi
    fi
}

# Process each top-level item
jq -c '.structure[]' "$CONFIG_FILE" | while read -r item; do
    process_item "$WORKSPACE_ROOT" "$item"
done

echo ""
echo "Workspace setup complete!"
