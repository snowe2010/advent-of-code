# frozen_string_literal: true

require 'pp'
require_relative '../helpers/input_reader'

def find_low_points_in_rows(row, y)
  row.each_with_index.map do |height, x|
    if x == 0 && height < row[x + 1]
      [x, y]
    elsif x == row.size - 1 && height < row[x - 1]
      [x, y]
    elsif row[x - 1] > height && height < row[x + 1]
      [x, y]
    end
  end.compact
end

execute(1) do |lines|
  heightmap = lines.map(&:chars).map { _1.map(&:to_i) }
  lowest_in_rows = heightmap.each_with_index.map { |row, y| find_low_points_in_rows(row, y) }.flatten(1)
  lowest_in_columns = heightmap.transpose
                               .each_with_index.map { |row, y| find_low_points_in_rows(row, y) }
                               .flatten(1)
                               .map { |y, x| [x, y] }

  risk_points = lowest_in_rows.intersection lowest_in_columns
  risk_points.sum { |x, y| heightmap[y][x] + 1 }
end

golf(1) do |lines|
end

execute(2) do |lines|
end

golf(2) do |lines|
end