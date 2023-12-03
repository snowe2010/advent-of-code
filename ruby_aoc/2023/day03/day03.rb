# frozen_string_literal: true

require 'pp'
require_relative '../helpers/input_reader'

def is_number?(char)
  /\d/ =~ char
end

# execute(1, test_only: true) do |lines|
#   char_map = lines.map do |line|
#     line.chars
#   end
#   char_map
#   true_false_map = char_map.map do |charline|
#     charline.map do |char|
#       if /\W/.match(char) && char != '.'
#         true
#       else
#         false
#       end
#     end
#   end
#   true_false_map = char_map.map do |charline|
#     charline.map do |char|
#       if /\W/.match(char) && char != '.'
#         true
#       else
#         false
#       end
#     end
#   end
#   total_sum = 0
#   true_false_map.each_with_index do |line, row_index|
#     line.each_with_index do |is_symbol, column_index|
#       if is_symbol
#         # anything above matches
#         if is_number?(char_map[row_index - 1][column_index - 1]) ||
#           is_number?(char_map[row_index - 1][column_index]) ||
#           is_number?(char_map[row_index - 1][column_index + 1])
#           p "char_map[#{row_index - 1} #{column_index - 1}] is a number next to a symbol"
#           row = char_map[row_index - 1]
#           out = [{
#                    number: "",
#                    index_range: 0..0,
#                  }]
#           current_number = 0
#           row.each_with_index.each do |first_char, first_index|
#             if out[current_number].nil?
#               out[current_number] = {
#                 number: "",
#                 index_range: first_index..first_index
#               }
#             end
#             if is_number? first_char
#               out[current_number][:number] += first_char
#               out[current_number][:index_range] = out[current_number][:index_range].begin..first_index
#             end
#             unless is_number? first_char
#               current_number += 1
#             end
#           end
#           numbers_next_to_symbols = out.select do |obj|
#             number = obj[:number]
#             /\d/.match?(number) && number != "" &&
#               (obj[:index_range].cover?(column_index - 1) || obj[:index_range].cover?(column_index) || obj[:index_range].cover?(column_index + 1))
#           end
#           total_sum += numbers_next_to_symbols.map { |o| o[:number].to_i }.sum
#           p "#{numbers_next_to_symbols} is next to a symbol!"
#         end
#
#         if row_index < char_map.size - 1 &&
#           (is_number?(char_map[row_index + 1][column_index - 1]) ||
#             is_number?(char_map[row_index + 1][column_index]) ||
#             is_number?(char_map[row_index + 1][column_index + 1]))
#           p "char_map[#{row_index + 1} #{column_index - 1}] is a number next to a symbol"
#           row = char_map[row_index + 1]
#           out = [{
#                    number: "",
#                    index_range: 0..0,
#                  }]
#           current_number = 0
#           row.each_with_index.each do |first_char, first_index|
#             if out[current_number].nil?
#               out[current_number] = {
#                 number: "",
#                 index_range: first_index..first_index
#               }
#             end
#             if is_number? first_char
#               out[current_number][:number] += first_char
#               out[current_number][:index_range] = out[current_number][:index_range].begin..first_index
#             end
#             unless is_number? first_char
#               current_number += 1
#             end
#           end
#           numbers_next_to_symbols = out.select do |obj|
#             number = obj[:number]
#             /\d/.match?(number) && number != "" &&
#               (obj[:index_range].cover?(column_index - 1) || obj[:index_range].cover?(column_index) || obj[:index_range].cover?(column_index + 1))
#           end
#           p "#{numbers_next_to_symbols} is next to a symbol!"
#           total_sum += numbers_next_to_symbols.map { |o| o[:number].to_i }.sum
#         end
#
#         # inline solutions
#         if is_number? char_map[row_index][column_index - 1]
#           p "char_map[#{row_index} #{column_index - 1}] is a number next to a symbol"
#           row = char_map[row_index]
#           slice_before = row[0..column_index - 1]
#           number = slice_before.reverse.take_while { |char| is_number? char }.reverse.join
#           p "#{number} is next to a symbol!"
#           total_sum += number.to_i
#         end
#
#         if is_number? char_map[row_index][column_index + 1]
#           p "char_map[#{row_index} #{column_index + 1}] is a number next to a symbol"
#           row = char_map[row_index]
#           slice_before = row[column_index + 1..-1]
#           number = slice_before.take_while { |char| is_number? char }.reverse.join
#           p "#{number} is next to a symbol!"
#           total_sum += number.to_i
#         end
#       end
#     end
#   end
#   total_sum
# end

execute(1, test_only: false, alternative_text: "retry") do |lines|
  whole_parts_list = []
  whole_symbols_list = []
  what = lines.each_with_index.map do |line, row_index|
    symbols_map = []
    parts_list = []
    current_part = 0
    line.chars.each_with_index do |char, i|
      if is_number? char
        if parts_list[current_part].nil?
          parts_list[current_part] = {
            number: "",
            index_range: i..i,
            row: row_index,
          }
        end
        parts_list[current_part][:number] += char
        parts_list[current_part][:index_range] = parts_list[current_part][:index_range].begin..i
      end
      unless char.match?(/\.|\d/)
        if symbols_map[current_part].nil?
          symbols_map[current_part] = {
            column: i,
            row: row_index,
          }
        end
      end
      unless is_number? char
        current_part += 1
      end
    end
    whole_parts_list << parts_list.compact.flatten
    whole_symbols_list << symbols_map.compact.flatten
    # [compacted, symbols_map.compact]
  end
  # parts_list, symbols =

  parts_list = whole_parts_list.flatten.compact
  symbols = whole_symbols_list.flatten.compact
  p "parts list #{whole_parts_list}"
  p "symbols #{symbols}"
  selected_parts = whole_parts_list.flatten.select do |part|
    number, index_range, row = part.values_at(:number, :index_range, :row)
    symbol_near_row = symbols.select { |symbol| symbol[:row] == row + 1 || symbol[:row] == row || symbol[:row] == row - 1 }
    symbol_near_col = symbol_near_row.any? do |symbol|
      index_range.cover?(symbol[:column]) || index_range.cover?(symbol[:column] - 1) || index_range.cover?(symbol[:column] + 1)
    end
    p "#{number} has symbol near row #{symbol_near_row} and column #{symbol_near_col}"
    symbol_near_row && symbol_near_col
  end
  p "selected parts #{selected_parts}"
  selected_parts.sum {|part|part[:number].to_i}
end

execute(2, test_only: false, alternative_text: "") do |lines|
  whole_parts_list = []
  whole_symbols_list = []
  what = lines.each_with_index.map do |line, row_index|
    symbols_map = []
    parts_list = []
    current_part = 0
    line.chars.each_with_index do |char, i|
      if is_number? char
        if parts_list[current_part].nil?
          parts_list[current_part] = {
            number: "",
            index_range: i..i,
            row: row_index,
          }
        end
        parts_list[current_part][:number] += char
        parts_list[current_part][:index_range] = parts_list[current_part][:index_range].begin..i
      end
      if char.match?(/\*/)
        if symbols_map[current_part].nil?
          symbols_map[current_part] = {
            column: i,
            row: row_index,
          }
        end
      end
      unless is_number? char
        current_part += 1
      end
    end
    whole_parts_list << parts_list.compact.flatten
    whole_symbols_list << symbols_map.compact.flatten
    # [compacted, symbols_map.compact]
  end
  # parts_list, symbols =
  whole_parts_list.flatten!
  whole_parts_list.compact!

  whole_symbols_list = whole_symbols_list.flatten.compact
  whole_symbols_list.sum do |symbol|
    gears = whole_parts_list.select do |part|
      col = symbol[:column]
      symbol_row = symbol[:row]
      range = part[:index_range]
      part_row = part[:row]
      (range.cover?(col) || range.cover?(col - 1) || range.cover?(col + 1)) &&
        (part_row == symbol_row || part_row == symbol_row - 1 || part_row == symbol_row + 1)
    end
    if gears.length == 2
      gears[0][:number].to_i * gears[1][:number].to_i
    else
      0
    end
  end
end
