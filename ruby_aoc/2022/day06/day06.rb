# frozen_string_literal: true

require 'pp'
require_relative '../helpers/input_reader'

execute(1) do |lines|
  lines.map do |line|
    line.chars.each_cons(4).find_index {|packet| packet.uniq.size == packet.size } + 4
  end
end

execute(2) do |lines|
  lines.map do |line|
    line.chars.each_cons(14).find_index {|packet| packet.uniq.size == packet.size } + 14
  end
end
