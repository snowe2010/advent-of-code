# frozen_string_literal: true

require 'pp'
require_relative '../helpers/input_reader'

execute(1) do |lines|
  count = 0
  lines.each do |line|
    _, output = line.split(" | ")
    output.split(" ").each do |code|
      count += 1 if [2, 4, 3, 7].include? code.size
    end
  end
  count
end

execute(1, alternative_text: "Golf") do |lines|
  lines.map{|l|l.split("|").last.split.select{[2,4,3,7].include?_1.size}.size}.sum
end

def find_1748(input)
  hsh = {}
  input.each do |code|
    num = case code.size
          when 2
            1
          when 3
            7
          when 4
            4
          when 7
            8
          end
    hsh[num] = code.chars
  end
  hsh
end

def find_ag(input)
  arr = []
  input.each do |code|
    arr << case code.size
           when 5, 6, 7
             code.chars.sort
           end
  end

  head, *tail = arr.compact.uniq.map { |i| i.sort }
  head.intersection *tail
end

def find_5(input)
  input.map { |code| code.size == 5 ? code.chars : nil }.compact
end

def find_2(five_chars, four)
  five_chars.find { |code| code.intersection(four).size == 2 }
end

def find_3(five_chars, one)
  five_chars.find { |code| code.intersection(one).size == 2 }
end

def find_b(numbers)
  numbers[4].intersection(numbers[5]) - numbers[5].intersection(numbers[3])
end

def find_c(numbers)
  numbers[4] - numbers[5]
end

def find_d(numbers)
  numbers[2].intersection(numbers[3], numbers[4], numbers[5])
end

def find_e(numbers)
  numbers[2] - numbers[3]
end

def find_f(numbers)
  numbers[3].intersection(numbers[4], numbers[5]) - numbers[2]
end

execute(2) do |lines|
  lines.map do |current_line|
    input, output = current_line.split(" | ").map(&:split)
    base_hash = find_1748 input
    ag = find_ag input
    five_chars = find_5 input

    base_hash[2] = find_2(five_chars, base_hash[4])
    base_hash[3] = find_3(five_chars, base_hash[1])
    five_chars.delete base_hash[2]
    five_chars.delete base_hash[3]
    base_hash[5] = five_chars[0]

    b = find_b base_hash
    c = find_c base_hash
    d = find_d base_hash
    e = find_e base_hash
    f = find_f base_hash

    a = base_hash[1].difference(base_hash[7]) + base_hash[7].difference(base_hash[1])
    g = ag - a
    puts "A=#{a} b=#{b} c=#{c} d=#{d} e=#{e} f=#{f} g=#{g}"

    character_to_number = {
      [a, b, c, e, f, g].flatten.sort => 0,
      [c, f].flatten.sort => 1,
      [a, c, d, e, g].flatten.sort => 2,
      [a, d, g, c, f].flatten.sort => 3,
      [b, c, d, f].flatten.sort => 4,
      [a, d, g, b, f].flatten.sort => 5,
      [a, b, d, e, f, g].flatten.sort => 6,
      [a, c, f].flatten.sort => 7,
      [a, b, c, d, e, f, g].flatten.sort => 8,
      [a, b, c, d, f, g].flatten.sort => 9,
    }
    out = output.map do |code|
      character_to_number[code.split("").sort]
    end
    out.join.to_i
  end.sum
end