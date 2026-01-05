#!/bin/bash
# Ruby setup via chruby + ruby-install
# Installs Ruby 3.4.1 and CocoaPods for React Native iOS development

echo "Setting up Ruby..."

# Install Ruby 3.4.1
echo "Installing Ruby 3.4.1 (this may take a few minutes)..."
ruby-install ruby 3.4.1

# Source chruby for this session
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh

# Set Ruby 3.4.1 as active
chruby ruby-3.4.1

# Verify Ruby version
echo "Ruby version: $(ruby --version)"

# Install CocoaPods
echo "Installing CocoaPods..."
gem install cocoapods

# Verify CocoaPods
echo "CocoaPods version: $(pod --version)"

echo "Ruby setup complete!"
