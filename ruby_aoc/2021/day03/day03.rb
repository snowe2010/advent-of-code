# frozen_string_literal: true

require_relative '../helpers/input_reader'

def get_oxygen_generator_rating(depth, key_to_lines)
  # p key_to_lines
  return key_to_lines[0].to_i(2) if (key_to_lines.size == 1)
  one = key_to_lines.count{|i| i[depth] == "1"}
  zero = key_to_lines.count{|i| i[depth] == "0"}
  max = zero > one ? 0:1
  selected_lines = key_to_lines.select { |i| i[depth].to_i == max }
  get_oxygen_generator_rating(depth+1, selected_lines)
end

def get_co2_scrubber_rating(depth, key_to_lines)
  # p key_to_lines
  return key_to_lines[0].to_i(2) if (key_to_lines.size == 1)
  one = key_to_lines.count{|i| i[depth] == "1"}
  zero = key_to_lines.count{|i| i[depth] == "0"}
  max = zero > one ? 1:0
  selected_lines = key_to_lines.select { |i| i[depth].to_i == max }
  get_co2_scrubber_rating(depth+1, selected_lines)
end

execute(1) do |lines|
  length = lines[0].split('').length
  sum = Array.new(length, 0)
  lines.map do |line|
    bits = line.split('')
    bits.each_with_index do |bit, i|
      if bit == "0"
        sum[i.to_i] -= 1
      end
      if bit == "1"
        sum[i.to_i] += 1
      end
    end
  end
  sum.map { |i|i>0?1:0}.join.to_i(2) *sum.map { |i| i>0?0:1 }.join.to_i(2)
end

execute(2) do |lines|
  get_oxygen_generator_rating(0, lines) * get_co2_scrubber_rating(0, lines)
end
