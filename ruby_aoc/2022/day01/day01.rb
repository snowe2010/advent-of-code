# frozen_string_literal: true

require 'pp'
require_relative '../helpers/input_reader'

def prioritize(lines)
  lines.map(&:to_i).slice_when { |i| i == 0 }.to_a.map { |arr| arr.sum }
end

execute(1) do |lines|
  prioritize(lines).max
end

execute(2) do |lines|
  prioritize(lines).sort![-3..-1].sum
end
