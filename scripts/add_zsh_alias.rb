#!/usr/bin/env ruby
require 'pry'

new_alias = ARGV[0]

if ARGV.first.nil?
  puts "Supply an alias or gtfo"
  exit(1)
end


if ARGV.first.match?(/\w*=\w*/)
  _alias, _cmd = ARGV.first.split("=")

  # read existing aliases and find matches
  d = File.read("#{Dir.home}/.zsh_aliases")
  m = d.scan(/^alias.*$/)

  all_cmds = m.map do |cmd|
    cmd.match(/(?<=alias\s).*$/).to_s.split("=").first
  end

  if all_cmds.include?(_cmd)
    puts "Alias already exists, modify it instead."
    puts m.filter {|x| x.test(/^alias\s#{_cmd}.*$/)}.first
  end

  puts "Adding alias.."

  File.open("#{Dir.home}/.zsh_aliases", "a+") do |f|
    f << "alias #{ARGV.first}\n"
  end

  puts "Added #{_alias}"
else
  puts "Alias syntax is bad, try again."
  exit(1)
end
