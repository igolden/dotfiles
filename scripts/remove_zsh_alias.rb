#!/usr/bin/env ruby
require 'pry'
require 'fileutils'
require 'tempfile'

def remove_lines(input_file, matcher)
  File.open("#{input_file}.new", "w+") do |tmp|
    File.foreach(input_file) do |line|
      tmp << line unless line.include?("alias #{matcher}=")
    end
  end

  FileUtils.mv("#{input_file}.new", input_file)
end



if ARGV.first.nil?
  puts "Supply an alias or gtfo"
  exit(1)
end


if ARGV.first.to_s.include?(" ")
  puts "Alias should be a single word no spaces"
  exit(1)
else
  puts "Removing #{ARGV.first} alias"
  remove_lines("#{Dir.home}/.zsh_aliases", ARGV.first)
  puts "Done."
end
