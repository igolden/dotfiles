#!/bin/bash
# macOS System Settings

echo "Configuring macOS settings..."

# 1. CAPS-LOCK to CTRL (requires logout to take effect)
# hidutil property creates a temporary mapping; for persistence we use a LaunchAgent
# This maps Caps Lock (0x700000039) to Left Control (0x7000000E0)
hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x7000000E0}]}' >/dev/null

# Create LaunchAgent for persistent key remapping
mkdir -p ~/Library/LaunchAgents
cat > ~/Library/LaunchAgents/com.local.KeyRemapping.plist << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.local.KeyRemapping</string>
    <key>ProgramArguments</key>
    <array>
        <string>/usr/bin/hidutil</string>
        <string>property</string>
        <string>--set</string>
        <string>{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x7000000E0}]}</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
</dict>
</plist>
EOF
echo "  - CAPS-LOCK mapped to CTRL"

# 2. Keyboard repeat FAST
defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 10
echo "  - Keyboard repeat set to fast"

# 3. Trackpad speed FAST
defaults write -g com.apple.trackpad.scaling -float 3.0
echo "  - Trackpad speed set to fast"

# 4. Natural scroll OFF
defaults write -g com.apple.swipescrolldirection -bool false
echo "  - Natural scroll disabled"

echo ""
echo "macOS settings configured!"
echo "NOTE: Logout/restart required for some settings to take effect."
