# frozen_string_literal: true

require 'pp'
require_relative '../helpers/input_reader'

execute(1) do |lines|
  lines.map do |line|
    a, b = line.partition(/.{#{line.size / 2}}/)[1, 2]
    v = (a.chars.intersection b.chars).first
    v.ord > 96 ? v.ord - 96 : v.ord - 38
  end.sum
end

execute(2) do |lines|
  lines.each_slice(3)
       .map { |a, b, c| a.chars.intersection(b.chars).intersection(c.chars).first }
       .map { |v| v.ord > 96 ? v.ord - 96 : v.ord - 38 }
       .sum
end
