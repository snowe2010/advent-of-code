# frozen_string_literal: true

require 'pp'
require_relative '../helpers/input_reader'

def find_low_points_in_rows(row, y)
  row_low = []
  row.each_with_index do |height, x|
    if x == 0 && height < row[x+1]
      row_low << [x, y]
    elsif x == row.size-1 && height < row[x-1]
      row_low << [x, y]
    elsif row[x-1] > height && height < row[x+1]
      row_low << [x, y]
    end
  end
  row_low
end

execute(1) do |lines|
  heightmap = lines.map(&:chars).map{_1.map(&:to_i)}
  row_low = []
  heightmap.each_with_index do |row, y|
    row_low << find_low_points_in_rows(row, y)
  end
  lowest_in_rows= row_low.flatten(1)

  transposed_heightmap = heightmap.transpose
  column_low = []
  transposed_heightmap.each_with_index do |row, y|
    column_low << find_low_points_in_rows(row, y)
  end
  lowest_in_columns = column_low.flatten(1).map { |y,x| [x,y]  }

  risk_points = lowest_in_rows.intersection lowest_in_columns
  risk_points.sum { |x, y| heightmap[y][x] + 1 }
end

golf(1) do |lines|
end

execute(2) do |lines|
end

golf(2) do |lines|
end