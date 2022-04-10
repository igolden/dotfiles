#!/usr/bin/env ruby

require 'tempfile'

f = Tempfile.new
f.puts "hello_world"
f.close

original = File.read(f.path)

# open the user's default editor
exit(1) unless system "$EDITOR #{f.path}"

# read again and compare to original
File.read(f.path)
puts "Success."
