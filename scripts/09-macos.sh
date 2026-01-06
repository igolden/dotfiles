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

# 5. Login Items (startup apps)
echo "  - Adding startup apps..."
osascript -e 'tell application "System Events" to make new login item at end with properties {path:"/Applications/Rectangle.app", hidden:false}' 2>/dev/null || true
osascript -e 'tell application "System Events" to make new login item at end with properties {path:"/Applications/Alfred 5.app", hidden:false}' 2>/dev/null || true
echo "  - Rectangle and Alfred added to Login Items"

# 6. Spotlight/Alfred shortcuts
# Disable Spotlight shortcut (CMD+Space) - hotkey ID 64
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 64 '<dict><key>enabled</key><false/></dict>'
echo "  - Spotlight shortcut disabled"

# Set Alfred hotkey to CMD+Space
defaults write com.runningwithcrayons.Alfred-Preferences hotkey -dict keyChar -int 49 keyCode -int 49 modifierFlags -int 1048576 2>/dev/null || true
echo "  - Alfred hotkey set to CMD+Space"

# 7. Mission Control settings
# Disable auto-rearrange Spaces based on recent use
defaults write com.apple.dock mru-spaces -bool false
echo "  - Spaces auto-rearrange disabled"

# 8. iTerm2 - disable native tab style
defaults write com.googlecode.iterm2 TabStyle -int 0
echo "  - iTerm2 tab style set to traditional"

# 9. Dock configuration
dockutil --remove all --no-restart 2>/dev/null || true
dockutil --add /Applications/iTerm.app --no-restart 2>/dev/null || true
dockutil --add /Applications/Firefox.app --no-restart 2>/dev/null || true
dockutil --add /Applications/Linear.app --no-restart 2>/dev/null || true
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock show-recents -bool false
echo "  - Dock configured (iTerm2, Firefox, Linear + auto-hide)"

# 10. Default browser
defaultbrowser firefox 2>/dev/null || true
echo "  - Firefox set as default browser"

# Apply settings
killall Dock 2>/dev/null || true
/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u 2>/dev/null || true

echo ""
echo "macOS settings configured!"
echo "NOTE: Logout/restart required for some settings to take effect."
