# frozen_string_literal: true

require 'pp'
require_relative '../helpers/input_reader'


def convert_to_adjacency_list(lines)
  hsh = Hash.new { |hash, key| hash[key] = [] }
  lines.map { |i| i.split('-') }.each do |a, b|
    hsh[a] << b
    hsh[b] << a
  end
  hsh.each { |_, v| v.uniq! }
end

def find_paths(previous_node, adjacency_list, next_node, steps)
  adjacency_list[next_node].each do |node|

  end
end
execute(1) do |lines|
  adjacency_list = convert_to_adjacency_list lines
  # find_paths("start", adjacency_list, )
  adjacency_list["start"].each do |first_step|
    find_paths("start", adjacency_list, first_step)
  end
end

execute(2) do |lines|
end
