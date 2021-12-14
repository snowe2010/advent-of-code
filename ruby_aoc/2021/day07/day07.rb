# frozen_string_literal: true

require 'pp'
require_relative '../helpers/input_reader'

execute(1, test_only = false) do |lines|
  positions = lines[0].split(',').map(&:to_i)
  min, max = positions.minmax

  min.upto(max).map do |location|
    positions.map { |i| (i - location).abs }.sum
  end.min
end

golf(1) do |lines|
  p=lines[0].split(',').map(&:to_i)
  m,n=p.minmax
  m.upto(n).map{|l|p.map{(_1-l).abs}.sum}.min
end

execute(2, test_only = false) do |lines|
  positions = lines[0].split(',').map(&:to_i)
  min, max = positions.minmax

  min.upto(max).map do |location|
    positions.map do |i|
      a = (i - location).abs; (a ** 2 + a) / 2
    end.sum
  end.min
end

golf(2) do |lines|
  p=lines[0].split(',').map(&:to_i)
  m,n=p.minmax
  m.upto(n).map{|l|p.map{a=(_1-l).abs;(a**2+a)/2}.sum}.min
end
