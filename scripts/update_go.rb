#!/usr/bin/env ruby

require 'nokogiri'
require 'etc'


DL_PAGE = "https://golang.org/dl/"
TMP_DIR = "/tmp"

def get_html_lists
  path = "#{TMP_DIR}/dl_page.html"
  system "wget #{DL_PAGE} -O #{path}"
  f = File.read(path)
  html = Nokogiri::HTML(f)

  lists = html.css(".toggleVisible")
end

def get_versions(lists)
  versions = []

  lists.each do |list|
    versions << list.attr("id")
  end

  versions
end

def current_version
  str = `go version`
  version = str.gsub("go version", "")

  version_arch = version.split(" ")
  version = version_arch[0]
  arch = version_arch[1]

  return version, arch
end


def should_update(local, recent)

  local = local.gsub("go", "")
  recent = recent.gsub("go", "")

  localsplit = local.split(".")
  recentsplit = recent.split(".")

  #pp localsplit, recentsplit

  return true if localsplit[0].to_i < recentsplit[0].to_i
  return true if localsplit[1].to_i < recentsplit[1].to_i
  return true if localsplit[2].to_i < recentsplit[2].to_i
  puts "Upgrade available:"
  puts "CURRENT: #{local}"
  puts "UPGRADE: #{recent}"
  return false
end

def is_sudo? 

  if Etc.getpwuid.uid == 0
    return true
  else
    return false
  end
end

def download_src(html_list)
  dl_link =  html_list.css(".codetable").css("tr")[2].at_css("td a").attr("href")
  dl_version = dl_link.split("/").last
  system("wget #{dl_link} --directory-prefix=#{TMP_DIR}")

  "#{TMP_DIR}/#{dl_version}"
end

def unzip_src(dl_path)
  system "tar -c /usr/local -xf #{dl_path} &>/dev/null"
end

def download_and_install(html_list)
  v = download_src(html_list)
  unzip_src(v)
end

def uninstall_go
  system("rm -rf /usr/local/go")
  system("rm -rf /usr/local/bin/go")
end

def confirm?()
  puts "This will remove your current version of Go. Confirm with 'y'"
  y = gets.chomp

  if y == "y"
    return true
  else
    return false
  end
end

def cleanup
  system("rm #{TMP_DIR}/dl_page.html")
  system("rm #{TMP_DIR}/*.tar.gz*")
end

def run!
  begin
    raise "Must be ran as sudo" unless is_sudo?    
    version_lists = get_html_lists
    versions = get_versions(version_lists)
    most_recent = versions.first

    current, arch = current_version

    if should_update(current, most_recent)
      exit unless confirm?
      #uninstall_go
      #download_and_install(version_lists.first)
      cleanup
      pp "Successfully upgraded go to #{most_recent}"
    else
      pp "No newer versions"
    end
  rescue => e
    pp  e
    exit 1
  end
end

run!
