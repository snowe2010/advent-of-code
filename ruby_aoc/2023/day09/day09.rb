# frozen_string_literal: true

require 'pp'
require_relative '../helpers/input_reader'

def get_subsequent_reading(reading)
  puts "passed in readings #{reading}"
  if reading.all?(0)
    reading << 0
  else
    readings = reading.each_cons(2).map do |a, b|
      b - a
    end
    sub_reading = get_subsequent_reading(readings)
    reading << (reading[-1] + sub_reading[-1])
    puts "current reading #{reading}"
    reading
  end
end

execute(1) do |lines|
  lines.map do |reading|
    get_subsequent_reading(reading.split.map(&:to_i))
  end.map {|arr| arr[-1]}.sum
end


def get_preceeding_readings(reading)
  puts "passed in readings #{reading}"
  if reading.all?(0)
    reading.unshift(0)
  else
    readings = reading.each_cons(2).map do |a, b|
      b - a
    end
    sub_reading = get_preceeding_readings(readings)
    reading.unshift(reading[0] - sub_reading[0])
    puts "current reading #{readings} #{sub_reading}"
    reading
  end
end


execute(2, test_only: false, test_file_suffix: '') do |lines|
  outs = lines.map do |reading|
    get_preceeding_readings(reading.split.map(&:to_i))
  end.map {|arr| arr[0]}

  p outs

  outs.sum

end
