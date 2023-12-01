# frozen_string_literal: true

require 'pp'
require_relative '../helpers/input_reader'

def numeric?(lookAhead)
  lookAhead.match?(/[[:digit:]]/)
end

execute(1, test_file_suffix: "p1") do |lines|
  lines.inject(0) do |acc, line|
    d = line.gsub(/\D/,'')
    acc += (d[0] + d[-1]).to_i
  end
end

map = {
  "one": 1,
  "two": 2,
  "three": 3,
  "four": 4,
  "five": 5,
  "six": 6,
  "seven": 7,
  "eight": 8,
  "nine": 9,
}

execute(2) do |lines|
  lines.inject(0) do |acc, line|
    first_num = line.sub(/(one|two|three|four|five|six|seven|eight|nine)/) do |key|
      map[key.to_sym]
    end
    last_num = line.reverse.sub(/(enin|thgie|neves|xis|evif|ruof|eerht|owt|eno)/) do |key|
      map[key.reverse.to_sym]
    end

    d = first_num.chars.select { |num| numeric?(num) }
    e = last_num.chars.select { |num| numeric?(num) }
    acc += (d[0] + e[0]).to_i
  end
end

# 60 chars
execute(1, alternative_text: "Code Golf 60 bytes", test_file_suffix: "p1") do |lines|
  lines.inject(0){|a,l|d=l.gsub(/\D/,'');a+=(d[0]+d[-1]).to_i}
end

# 271 chars
execute(1, alternative_text: "Code Golf 271 bytes", test_file_suffix: "p1") do |z|
  z.inject(0) { |a, l|
    w = %w(one two three four five six seven eight nine)
    x = w.join(?|)
    f = l.sub(/(#{x})/) { |k| map[k.to_sym] }
    g = l.reverse.sub(/(#{x.reverse})/) { |k| map[k.reverse.to_sym] }
    d = f.chars.select { |n| n.match?(/\d/) }
    e = g.chars.select { |n| n.match?(/\d/) }
    a += (d[0] + e[0]).to_i
  }
end
