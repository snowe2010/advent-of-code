# frozen_string_literal: true

require 'pp'
require_relative '../helpers/input_reader'

opening = %w\[ ( < {\
closing = %w\] ) > }\
mapping = {
  '[' => ']',
  '{' => '}',
  '(' => ')',
  '<' => '>',
}
score = {
  ')' => 3,
  ']' => 57,
  '}' => 1197,
  '>' => 25137,
}
execute(1) do |lines|
  lines.map(&:chars).map do |line|
    char_selected = nil
    stack = []
    line.each do |char|
      next if char_selected
      # pp char
      if opening.include? char
        stack << char
      elsif closing.include? char
        if mapping[stack[-1]] == char
          stack.delete_at(-1)
        else
          char_selected = char
        end
      end
    end
    char_selected
  end.compact.map { |i| score[i] }.sum
end

# golf(1, true) do |lines|
# end

autocomplete_score = {
  ')' => 1,
  ']' => 2,
  '}' => 3,
  '>' => 4,
}

execute(2) do |lines|
  results = lines.map(&:chars).map do |line|
    bad_line = nil
    char_selected = nil
    stack = []
    line.each do |char|
      next if bad_line
      if opening.include? char
        stack << char
      elsif closing.include? char
        if mapping[stack[-1]] == char
          stack.delete_at(-1)
        else
          bad_line = true
        end
      end
    end
    if char_selected == nil && !bad_line
      stack.reverse.map { |i| mapping[i] }.map { |i| autocomplete_score[i] }.reduce(0) { |acc, i| acc * 5 + i }
    end
  end.compact.sort
  results[(results.size-1)/2]
end
#
# golf(2, true) do |lines|
# end