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

# 7. Mission Control - CREATE DESKTOPS FIRST
echo "  - Creating 8 desktops..."
osascript <<'APPLESCRIPT' 2>/dev/null || echo "    (Manual desktop creation may be needed)"
tell application "System Events"
    set frontApp to name of first application process whose frontmost is true
    do shell script "open -a 'Mission Control'"
    delay 1
    -- Click add desktop button 7 times (to get 8 total with default)
    repeat 7 times
        try
            click button 1 of group "Spaces Bar" of group 1 of group "Mission Control" of process "Dock"
            delay 0.5
        end try
    end repeat
    delay 0.5
    key code 53 -- Escape to close Mission Control
    delay 0.3
    tell application process frontApp to set frontmost to true
end tell
APPLESCRIPT

# 8. Mission Control settings (AFTER desktops exist)
# Disable auto-rearrange Spaces based on recent use
defaults write com.apple.dock mru-spaces -bool false
echo "  - Spaces auto-rearrange disabled"

# Set CMD+1 through CMD+8 for switching desktops
# Hotkey IDs: 118-125 for Desktop 1-8
# Parameters: (ASCII code, key code, 1048576=CMD modifier)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 118 '<dict><key>enabled</key><true/><key>value</key><dict><key>parameters</key><array><integer>49</integer><integer>18</integer><integer>1048576</integer></array><key>type</key><string>standard</string></dict></dict>'
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 119 '<dict><key>enabled</key><true/><key>value</key><dict><key>parameters</key><array><integer>50</integer><integer>19</integer><integer>1048576</integer></array><key>type</key><string>standard</string></dict></dict>'
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 120 '<dict><key>enabled</key><true/><key>value</key><dict><key>parameters</key><array><integer>51</integer><integer>20</integer><integer>1048576</integer></array><key>type</key><string>standard</string></dict></dict>'
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 121 '<dict><key>enabled</key><true/><key>value</key><dict><key>parameters</key><array><integer>52</integer><integer>21</integer><integer>1048576</integer></array><key>type</key><string>standard</string></dict></dict>'
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 122 '<dict><key>enabled</key><true/><key>value</key><dict><key>parameters</key><array><integer>53</integer><integer>23</integer><integer>1048576</integer></array><key>type</key><string>standard</string></dict></dict>'
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 123 '<dict><key>enabled</key><true/><key>value</key><dict><key>parameters</key><array><integer>54</integer><integer>22</integer><integer>1048576</integer></array><key>type</key><string>standard</string></dict></dict>'
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 124 '<dict><key>enabled</key><true/><key>value</key><dict><key>parameters</key><array><integer>55</integer><integer>26</integer><integer>1048576</integer></array><key>type</key><string>standard</string></dict></dict>'
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 125 '<dict><key>enabled</key><true/><key>value</key><dict><key>parameters</key><array><integer>56</integer><integer>28</integer><integer>1048576</integer></array><key>type</key><string>standard</string></dict></dict>'
echo "  - CMD+1 through CMD+8 set for desktop switching"

# 9. iTerm2 - disable native tab style
defaults write com.googlecode.iterm2 TabStyle -int 0
echo "  - iTerm2 tab style set to traditional"

# Apply settings
killall Dock 2>/dev/null || true
/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u 2>/dev/null || true

echo ""
echo "macOS settings configured!"
echo "NOTE: Logout/restart required for some settings to take effect."
