# frozen_string_literal: true

require 'pp'
require_relative '../helpers/input_reader'

def idk(starting_node, node_tree, instructions, &ending_condition)
  step_counter = 0

  current_node = starting_node
  loop do
    current_instruction = instructions[step_counter % instructions.size]
    node_identifier = if current_instruction == "L"
                        current_node[:left]
                      else
                        current_node[:right]
                      end
    current_node = node_tree[node_identifier]
    step_counter += 1
    break step_counter if ending_condition.call(node_identifier)
  end
end

execute(1) do |lines|
  instructions = lines[0].chars
  node_tree = {}
  lines[2..-1].map do |node_line|
    capture = /(\w+) = \((\w+), (\w+)\)/.match(node_line).captures
    node_tree[capture[0]] = {
      left: capture[1],
      right: capture[2],
    }
  end
  idk(node_tree["AAA"], node_tree, instructions) {|ni|
    ni == "ZZZ"
  }
end

# execute(2, test_only: false, test_file_suffix: "_p2") do |lines|
#   instructions = lines[0].chars
#   node_tree = {}
#   lines[2..-1].map do |node_line|
#     capture = /(\w+) = \((\w+), (\w+)\)/.match(node_line).captures
#     node_tree[capture[0]] = {
#       left: capture[1],
#       right: capture[2],
#     }
#   end
#   step_counter = 0
#   node_identifier_list = node_tree.select { |k, v| k.end_with?("A") }.keys
#
#   loop do
#     nodes = node_identifier_list.map { |iden| node_tree[iden] }
#     node_identifier_list = []
#     nodes.map do |node|
#       current_instruction = instructions[step_counter % instructions.size]
#       if current_instruction == "L"
#         node_identifier_list << node[:left]
#       else
#         node_identifier_list << node[:right]
#       end
#     end
#     step_counter += 1
#     # p "Current step counter = #{step_counter}"
#     break step_counter if node_identifier_list.all? { |iden| iden.end_with? "Z" }
#   end
# end

@seen_keys = []

def convert_node_to_tree node, full_tree
  left = node[:left]
  right = node[:right]
  left_node = if @seen_keys.include? left
                left
              else
                @seen_keys << left
                convert_node_to_tree(full_tree[left], full_tree)
              end
  right_node = if @seen_keys.include? right
                 right
               else
                 @seen_keys << right
                 convert_node_to_tree(full_tree[right], full_tree)
               end
  {
    left: left_node,
    right: right_node
  }
end

# execute(2, alternative_text: "take 2", test_only: false, test_file_suffix: "_p2") do |lines|
#   instructions = lines[0].chars
#   node_tree = {}
#   lines[2..-1].map do |node_line|
#     capture = /(\w+) = \((\w+), (\w+)\)/.match(node_line).captures
#     node_tree[capture[0]] = {
#       left: capture[1],
#       right: capture[2],
#     }
#   end
#
#   starting_nodes = node_tree.select { |k, v| k.end_with? "A" }
#
#   node_tree = starting_nodes.map { |node| convert_node_to_tree(node[1], node_tree) }
#   node_tree = node_tree.to_h
#   step_counter = 0
#   node_identifier_list = node_tree.select { |k, v| k.end_with?("A") }.keys
#
#   loop do
#     nodes = node_identifier_list.map { |iden| node_tree[iden] }
#     node_identifier_list = []
#     nodes.map do |node|
#       current_instruction = instructions[step_counter % instructions.size]
#       if current_instruction == "L"
#         node_identifier_list << node[:left]
#       else
#         node_identifier_list << node[:right]
#       end
#     end
#     step_counter += 1
#     p "Current step counter = #{step_counter}"
#     break step_counter if node_identifier_list.all? { |iden| iden.end_with? "Z" }
#   end
# end

execute(2, alternative_text: "LCM", test_only: false, test_file_suffix: "_p2") do |lines|
  instructions = lines[0].chars
  node_tree = {}
  lines[2..-1].map do |node_line|
    node, left, right = /(\w+) = \((\w+), (\w+)\)/.match(node_line).captures
    node_tree[node] = {
      left: left,
      right: right,
    }
  end

  amd = node_tree.select { |k, v| k.end_with?("A") }
                 .map { |node, value| idk(value, node_tree, instructions) { |ni|
                   ni.end_with? "Z"
                 }}

  amd.inject(1, &:lcm)
end