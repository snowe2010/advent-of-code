# frozen_string_literal: true

require 'pp'
require_relative '../helpers/input_reader'

def count_steps_to_node(starting_node, node_tree, instructions, &ending_condition)
  step_counter = 0
  current_node = starting_node
  loop do
    current_instruction = instructions[step_counter % instructions.size]
    node_identifier = current_node[current_instruction]
    current_node = node_tree[node_identifier]
    step_counter += 1
    break step_counter if ending_condition.call(node_identifier)
  end
end

execute(1) do |lines|
  instructions = lines[0].chars
  node_tree = {}
  lines[2..-1].map do |node_line|
    node, left, right = /(\w+) = \((\w+), (\w+)\)/.match(node_line).captures
    node_tree[node] = { "L"=> left,"R"=> right }
  end
  count_steps_to_node(node_tree["AAA"], node_tree, instructions) { |i| i == "ZZZ" }
end

execute(2, alternative_text: "LCM", test_only: false, test_file_suffix: "_p2") do |lines|
  instructions = lines[0].chars
  node_tree = {}
  lines[2..-1].map do |node_line|
    node, left, right = /(\w+) = \((\w+), (\w+)\)/.match(node_line).captures
    node_tree[node] = {
      "L"=> left,
      "R"=> right,
    }
  end

  node_tree.select { |k, _| k.end_with?("A") }
           .map do |_, value|
    count_steps_to_node(value, node_tree, instructions) { |i| i.end_with? "Z" }
  end.inject(1, &:lcm)
end