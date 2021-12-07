require 'pp'
require_relative '../helpers/input_reader'

execute(1) do |lines|
  points = Hash.new { |hash, key| hash[key] = 0 }
  lines.each do |line|
    x1, y1, x2, y2 = line.sub(' -> ', ',').split(',').map(&:to_i)
    puts "(#{x1},#{y1}) (#{x2},#{y2})"
    next unless x1 == x2 || y1 == y2
    # puts "here"
    if x1 == x2
      # puts "xs ="
      low, high = [y1, y2].minmax
      (low..high).each do |y|
        # puts "x1==x2 (#{x1},#{y})"
        points["#{x1},#{y}"] += 1
      end
    end

    next unless y1 == y2
    # puts "ys ="
    low, high = [x1, x2].minmax
    # puts "Low high #{low} #{high}"
    (low..high).each do |x|
      # puts "y1==y2 (#{x},#{y1})"
      points["#{x},#{y1}"] += 1
    end
  end
  pp points
  points.count {|_, sum| sum >= 2 }
end

execute(2) do |lines|
end
