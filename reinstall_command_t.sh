#!/bin/bash

cd ~/dotfiles/vim/bundle
rm -rf command-t
git clone https://github.com/wincent/command-t
cd command-t/ruby/command-t/ext/command-t
ruby extconf.rb
make
cd ~

