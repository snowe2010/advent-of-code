# frozen_string_literal: true

require 'pp'
require_relative '../helpers/input_reader'

execute(1, test_only = false) do |lines|
  positions = lines[0].split(',').map(&:to_i)
  min, max = positions.minmax

  sums = min.upto(max).map do |location|
    positions.map { |i| (i - location).abs }.sum
  end.min

  pp sums
end

execute(2, test_only = false) do |lines|
  positions = lines[0].split(',').map(&:to_i)
  min, max = positions.minmax

  sums = min.upto(max).map do |location|
    positions.map { |i| a=(i - location).abs;(a**2+a)/2 }.sum
  end.min

  pp sums
end
