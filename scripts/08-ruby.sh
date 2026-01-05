#!/bin/bash
# Ruby setup via chruby + ruby-install
# Installs Ruby 3.4.1 and CocoaPods for React Native iOS development

echo "Setting up Ruby..."

# Source chruby for this session
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh 2>/dev/null || true
source /opt/homebrew/opt/chruby/share/chruby/auto.sh 2>/dev/null || true

# Install Ruby 3.4.1 if not already installed
if ! ruby-install --no-install-deps ruby 2>/dev/null | grep -q "ruby-3.4.1" || ! [[ -d "$HOME/.rubies/ruby-3.4.1" ]]; then
    echo "Installing Ruby 3.4.1 (this may take a few minutes)..."
    ruby-install ruby 3.4.1
else
    echo "Ruby 3.4.1 already installed, skipping..."
fi

# Set Ruby 3.4.1 as active
chruby ruby-3.4.1 2>/dev/null || true

# Verify Ruby version
echo "Ruby version: $(ruby --version 2>/dev/null || echo 'not available')"

# Install CocoaPods if not already installed
if ! gem list cocoapods -i &>/dev/null; then
    echo "Installing CocoaPods..."
    gem install cocoapods
else
    echo "CocoaPods already installed, skipping..."
fi

# Verify CocoaPods
echo "CocoaPods version: $(pod --version 2>/dev/null || echo 'not available')"

echo "Ruby setup complete!"
