# frozen_string_literal: true

require 'pp'
require_relative '../helpers/input_reader'

def padright!(a, n, x)
  a.fill(x, a.length...n)
end

execute(1) do |lines|
  columns_row = lines.find { |line| line.start_with? " 1 " }
  columns_row_index = lines.find_index(columns_row)
  columns_row_size = columns_row.split(' ').size
  boxes = lines[0...columns_row_index]
            .map { |line| line.chars.each_slice(4).to_a }
            .map { |line_array|
              line_array.map { |current_box_chars|
                current_box_chars[1]
              }
            }
            .map { |line_array| padright!(line_array, columns_row_size, " ") }
            .reduce(&:zip)
            .map(&:flatten)[0...columns_row_size]
            .tap { |i| p i }
            .map { |line_array|
              line_array.reject { |elem| elem == " " }
            }
  puts "Boxes before moving"
  pp boxes

  instructions = lines[columns_row_index + 2..lines.size - 1]
                   .map { |instruction|
                     instruction.match(/move (?<count>\d+) from (?<from_stack>\d+) to (?<to_stack>\d+)/)
                                .named_captures
                                .transform_keys(&:to_sym)
                                .transform_values(&:to_i)
                   }

  instructions.each do |instruction|
    instruction => { count:, from_stack:, to_stack: }
    puts "Moving #{count} items from #{from_stack} to #{to_stack}"
    count.times do |_|
      moving_box = boxes[from_stack - 1].shift

      boxes[to_stack - 1].unshift(moving_box)
      puts "After moving #{boxes}"
    end
    p boxes
  end
  boxes.map {|arr| arr[0]}.join
end

execute(2) do |lines|
  columns_row = lines.find { |line| line.start_with? " 1 " }
  columns_row_index = lines.find_index(columns_row)
  columns_row_size = columns_row.split(' ').size
  boxes = lines[0...columns_row_index]
            .map { |line| line.chars.each_slice(4).to_a }
            .map { |line_array|
              line_array.map { |current_box_chars|
                current_box_chars[1]
              }
            }
            .map { |line_array| padright!(line_array, columns_row_size, " ") }
            .reduce(&:zip)
            .map(&:flatten)[0...columns_row_size]
            .tap { |i| p i }
            .map { |line_array|
              line_array.reject { |elem| elem == " " }
            }
  puts "Boxes before moving"
  pp boxes

  instructions = lines[columns_row_index + 2..lines.size - 1]
                   .map { |instruction|
                     instruction.match(/move (?<count>\d+) from (?<from_stack>\d+) to (?<to_stack>\d+)/)
                                .named_captures
                                .transform_keys(&:to_sym)
                                .transform_values(&:to_i)
                   }

  instructions.each do |instruction|
    instruction => { count:, from_stack:, to_stack: }
    puts "Moving #{count} items from #{from_stack} to #{to_stack}"
    moving_box = boxes[from_stack - 1].shift(count)

    boxes[to_stack - 1].unshift(*moving_box)
    puts "After moving #{boxes}"
    p boxes
  end
  boxes.map {|arr| arr[0]}.join
end
