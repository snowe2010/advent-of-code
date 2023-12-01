# frozen_string_literal: true

require 'pp'
require_relative '../helpers/input_reader'

def numeric?(lookAhead)
  lookAhead.match?(/[[:digit:]]/)
end

execute(1, false, "", test_file_suffix = "p1") do |lines|
  lines.inject(0) do |acc, line|
    d = line.chars.select { |num| numeric?(num) }
    var = (d[0] + d.reverse[0]).to_i
    acc += var
  end
end

map = {
  "one": 1,
  "eno": 1,
  "two": 2,
  "owt": 2,
  "three": 3,
  "eerht": 3,
  "four": 4,
  "ruof": 4,
  "five": 5,
  "evif": 5,
  "six": 6,
  "xis": 6,
  "seven": 7,
  "neves": 7,
  "eight": 8,
  "thgie": 8,
  "nine": 9,
  "enin": 9,
}

execute(2) do |lines|
  lines.inject(0) do |acc, line|
    first_num = line.sub(/(one|two|three|four|five|six|seven|eight|nine)/) do |key|
      map[key.to_sym]
    end
    last_num = line.reverse.sub(/(enin|thgie|neves|xis|evif|ruof|eerht|owt|eno)/) do |key|
      map[key.to_sym]
    end

    d = first_num.chars.select { |num| numeric?(num) }
    e = last_num.chars.select { |num| numeric?(num) }
    acc += (d[0] + e[0]).to_i
  end
end
