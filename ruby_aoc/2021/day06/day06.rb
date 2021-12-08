# frozen_string_literal: true

require 'pp'
require_relative '../helpers/input_reader'

execute(1) do |lines|
  lanternfishies = lines[0].split(',').map(&:to_i)
  80.times do
    # p lanternfishies
    new_fish = lanternfishies.count {|fish| fish == 0}
    lanternfishies = lanternfishies.map do |lanternfish|
      if lanternfish == 0
        6
      else
        lanternfish-1
      end
    end
    new_fish.times { lanternfishies << 8 }
  end
  p lanternfishies.size
end

execute(2) do |lines|
end
