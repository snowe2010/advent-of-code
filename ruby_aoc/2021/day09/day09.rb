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


def f(r,y)=r.each_with_index.map{|h,x|[x,y]if(x==0&&h<r[x+1])||(x==r.size-1&&h<r[x-1])||(r[x-1]>h&&h<r[x+1])}.compact

golf(1) do |l|
h=l.map(&:chars).map{ _1.map(&:to_i)}
h.each_with_index.map{f _1,_2}.flatten(1).intersection(h.transpose
.each_with_index.map{f _1,_2}
.flatten(1)
.map{[_2,_1]}).sum{h[_2][_1]+1}
end

def go_up(heightmap, x, y, passed_points=[])
  return if y==0
  find_region(heightmap, x, y - 1, passed_points)
end

def go_right(heightmap, x, y, passed_points=[])
  return if x==heightmap[0].size-1
  find_region(heightmap, x + 1, y, passed_points)
end

def go_down(heightmap, x, y, passed_points=[])
  return if y==heightmap.size-1
  find_region(heightmap, x, y + 1, passed_points)
end

def go_left(heightmap, x, y, passed_points=[])
  return if x==0
  find_region(heightmap, x-1, y, passed_points)
end

def find_region(heightmap, x, y, passed_points = [])
  return if passed_points.include? [x, y]
  return unless heightmap[y][x]
  passed_points << [x, y]
  go_up(heightmap, x, y, passed_points)
  go_right(heightmap, x, y, passed_points)
  go_down(heightmap, x, y, passed_points)
  go_left(heightmap, x, y, passed_points)
  passed_points.compact
end

execute(2, false) do |lines|
  heightmap = lines.map(&:chars).map { _1.map {|i| i.to_i < 9} }
  max_y = heightmap.size
  max_x = heightmap[0].size

  regions = []
  max_y.times do |y|
    max_x.times do |x|
      if heightmap[y][x]
        regions << find_region(heightmap, x, y)
      end
    end
  end
  regions.map(&:sort).uniq.map { |i| i.size }.sort.reverse.take(3).reduce {|acc, i| acc * i}
end

golf(2) do |lines|
end