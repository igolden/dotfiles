#!/usr/bin/env ruby

require 'fileutils'

DESKTOP_PATH = "/Users/igolden/Desktop"

entries = Dir.entries(DESKTOP_PATH)

entries.each do |entry|
  if  entry.include? "Screenshot"
    FileUtils.rm("#{DESKTOP_PATH}/#{entry}")
  end
end

