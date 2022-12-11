# frozen_string_literal: true

require 'pp'
require_relative '../helpers/input_reader'

FileInfo = Struct.new('FileInfo', :size, :name)


def recurse_directories(directory_name, lines)
  p lines
  hsh = Hash.new { |hash, key| hash[key] = [] }
  until lines.empty?
    line = lines.shift
    puts "Current element #{line}"
    if line.start_with? "$ cd"
      new_directory_name = line.match(/\$ cd (?<name>.*)/).named_captures["name"]
      if new_directory_name == ".."
        puts "Cding down a directory #{hsh}"
        return hsh
      end
      recurse_directories = recurse_directories(new_directory_name, lines)
      hsh[directory_name] << recurse_directories
      puts "Just recursed a directory #{hsh}"
      hsh
    else
      next if line.start_with? "$ ls" or line.start_with? "dir "
      file = FileInfo.new(*line.split)
      hsh[directory_name] << file
      puts "Adding a regular line #{hsh}"
      hsh
    end
  end
  hsh
end

def convert_nested_hashes_to_array(hash)
  hash.each do |key, value|
    sum = 0
    value.each do |item|
      if item.is_a? Hash
        convert_nested_hashes_to_array(item)
      else
        sum += item.to_i
      end
    end
  end
  return sum
end
execute(1) do |lines|
  directory_structure = recurse_directories( nil, lines)
  convert_nested_hashes_to_array(directory_structure)
end

execute(2) do |lines|
end
