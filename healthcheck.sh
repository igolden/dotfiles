#!/bin/bash
# Healthcheck script - verify all expected commands are available

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

PASS=0
FAIL=0

check_command() {
    local cmd=$1
    local path=$(command -v "$cmd" 2>/dev/null)

    if [[ -n "$path" ]]; then
        printf "${GREEN}✓${NC} %-12s %s\n" "$cmd" "$path"
        ((PASS++))
    else
        printf "${RED}✗${NC} %-12s NOT FOUND\n" "$cmd"
        ((FAIL++))
    fi
}

echo ""
echo "Healthcheck Results"
echo "==================="
echo ""

echo "--- Core CLI ---"
check_command git
check_command gh
check_command nvim
check_command rg
check_command jq
check_command wget
check_command htop
check_command tmux
check_command fzf

echo ""
echo "--- Runtimes ---"
check_command fnm
check_command node
check_command npm
check_command python3
check_command go
check_command ruby
check_command pod

echo ""
echo "--- Project Tools ---"
check_command ffmpeg
check_command yt-dlp
check_command psql
check_command redis-cli
check_command watchman
check_command docker
check_command aws

echo ""
echo "--- npm Globals ---"
check_command claude
check_command wrangler

echo ""
echo "==================="
TOTAL=$((PASS + FAIL))
echo "Passed: $PASS/$TOTAL"

if [[ $FAIL -gt 0 ]]; then
    echo ""
    echo "Some commands are missing. Run the appropriate install scripts."
    exit 1
fi
