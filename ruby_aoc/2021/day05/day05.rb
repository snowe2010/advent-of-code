# frozen_string_literal: true

require 'pp'
require_relative '../helpers/input_reader'

def find_vents(lines, &block)
  points = Hash.new(0)
  lines.each do |line|
    x1, y1, x2, y2 = line.sub(' -> ', ',').split(',').map(&:to_i)
    next unless block.call(x1, y1, x2, y2)

    points[[x1, y1]] += 1
    x_step = x2 <=> x1
    y_step = y2 <=> y1
    until [x1, y1] == [x2, y2]
      x1 += x_step
      y1 += y_step
      points[[x1, y1]] += 1
    end
  end
  points.count { |_, sum| sum >= 2 }
end

execute(1) do |lines|
  find_vents(lines) { |x1, y1, x2, y2| x1 == x2 || y1 == y2 }
end

execute(2) do |lines|
  find_vents(lines) { true }
end
