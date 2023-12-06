# frozen_string_literal: true

require 'pp'
require_relative '../helpers/input_reader'
require 'matrix'

execute(1) do |lines|
  p Matrix[*lines.map(&:split)]
  td_rows = Matrix[*lines.map(&:split)].transpose.to_a

  td_rows[1..-1].map do |time, distance|
    time = time.to_i
    distance = distance.to_i
    # p time, distance
    0.upto(time).count do |held_down|
      remaining_time = time - held_down
      my_distance = remaining_time * held_down
      # p my_distance
      distance < my_distance
    end
  end.inject(&:*)
end

execute(2, test_only: false) do |lines|

  time, distance = lines.map { |line| line.split(':')[1].gsub(' ', '').to_i }

  time = time.to_i
  distance = distance.to_i
  # p time, distance
  puts "Time #{time}"
  puts "distance #{distance}"
  first_winning_index = 0
  0.upto(time) do |held_down|
    remaining_time = time - held_down
    my_distance = remaining_time * held_down
    if distance < my_distance
      puts "My distance #{my_distance}"
      first_winning_index = held_down
      break
    end
  end
  last_winning_index = 0
  time.downto(0) do |held_down|
    remaining_time = time - held_down
    my_distance = remaining_time * held_down
    if distance < my_distance
      puts "My distance #{my_distance}"
      last_winning_index = held_down
      break
    end
  end
  puts "winning indexes #{first_winning_index} #{last_winning_index}"
  last_winning_index - first_winning_index + 1

end
