# frozen_string_literal: true

require 'pp'
require_relative '../helpers/input_reader'

def count_fish(input, days)
  lanternfishies = input.split(',').map(&:to_i).tally
  lanternfishies.default = 0
  days.times do
    lanternfishies.transform_keys! {|k| k - 1}
    lanternfishies[8] += lanternfishies[-1]
    lanternfishies[6] += lanternfishies[-1]
    lanternfishies.delete(-1)
  end
  lanternfishies.values.sum
end

execute(1) do |lines|
  count_fish lines[0], 80
end

execute(2) do |lines|
  count_fish lines[0], 256
end
