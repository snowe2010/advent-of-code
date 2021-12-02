# frozen_string_literal: true

require_relative '../helpers/input_reader'

execute(1) do |lines|
  hsh = Hash.new(0)
  lines.map(&:split).each do |dir, amount|
    hsh[dir] += amount.to_i
  end
  hsh['forward'] * (hsh['down'] - hsh['up'])
end

execute(2) do |lines|
  hp = 0
  aim = 0
  depth = 0
  lines.map(&:split).each do |dir, amount|
    a = amount.to_i
    if dir == 'forward'
      hp += a
      depth += aim * a
    end
    aim += a if dir == 'down'
    aim -= a if dir == 'up'
  end
  puts "hp #{hp} aim #{aim} depth #{depth}"
  hp * depth
end
