# frozen_string_literal: true

require 'pp'
require_relative '../helpers/input_reader'

FileInfo = Struct.new('FileInfo', :size, :name, :files, :type)

def recurse_directories(directory_name, lines)
  p lines
  hsh = Hash.new { |hash, key| hash[key] = [] }
  current_dir = FileInfo.new
  current_dir.name = directory_name
  current_dir.files = []
  current_dir.size = 0
  current_dir.type = :dir
  until lines.empty?
    line = lines.shift
    puts "Current element #{line}"
    if line.start_with? "$ cd"
      new_directory_name = line.match(/\$ cd (?<name>.*)/).named_captures["name"]
      if new_directory_name == ".."
        size = current_dir.files.sum { |f| f.size }
        current_dir.size = size
        puts "CDing down a directory #{current_dir}"
        puts "directory size is #{size}"
        return current_dir
      end
      recurse_directories = recurse_directories(new_directory_name, lines)
      current_dir.size += recurse_directories.size
      current_dir.files << recurse_directories
      puts "Just recursed a directory #{current_dir}"
      current_dir
    else
      next if line.start_with? "$ ls" or line.start_with? "dir "
      size, name = line.split
      file = FileInfo.new(size.to_i, name)
      current_dir.files << file
      current_dir.size += size.to_i
      file.type = :file
      puts "Adding a regular line #{current_dir}"
      current_dir
    end
  end
  current_dir
end


def find_directory_by_size(struct)
  directories = []
  puts "current struct is #{struct}"
  struct.files.each do |file|
    puts "file is #{file}"
    if file.type == :dir
      puts "file type is directory"
      directories << file
      directories << find_directory_by_size(file)
    end
  end
  puts "all directories I found? #{directories}"
  return directories
end

execute(1) do |lines|
  directory_structure = recurse_directories(nil, lines)
  directories = find_directory_by_size directory_structure
  directories.flatten!
  directories.map! { |struct| struct.size }
             .reject! { |size| size > 100000 }
             .sum
end

execute(2) do |lines|
  # total = 70000000
  needed_unused = 30000000
  system_size = 70000000
  directory_structure = recurse_directories(nil, lines)
  directories = find_directory_by_size directory_structure
  directories.flatten!
  directories.map! { |struct| struct.size }
  root = directory_structure.files[0].files.sum {|file| file.size }

  current_unused = system_size - root
  need_to_delete = needed_unused-current_unused
  puts "need to delete size #{need_to_delete}"
  directories.find_all {|a| a > need_to_delete }.min
end
