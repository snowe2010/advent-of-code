# frozen_string_literal: true

require_relative '../helpers/input_reader'

execute(1) do |lines|
  hsh = Hash.new(0)
  lines.map(&:split).each do |dir, amount|
    hsh[dir] += amount.to_i
  end
  hsh['forward'] * (hsh['down'] - hsh['up'])
end

# golfed
execute(1) do |lines|
  h=Hash.new(0)
  lines.map(&:split).each{h[_1[0]]+=_2.to_i}
  h[?f].*h[?d]-h[?u]
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

# golfed
execute(2) do |lines|
  h,a,d=0,0,0
  lines.map(&:split).each{|k,i|v=i.to_i;if k[?f];h+=v;d+=(a*v)end;a+=v if k[?n];a-=v if k[?u]}
  p h*d
end
