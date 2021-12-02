# frozen_string_literal: true

require_relative '../helpers/input_reader'

execute(1) do |lines|
  hsh = Hash.new(0)
  lines.map(&:split).each do |dir, amount|
    hsh[dir] += amount.to_i
  end
  hsh["forward"] * (hsh["down"] - hsh["up"])
end

# execute(2) do |lines|
# lines.map(&:to_i).each_cons(3).map { |a, b, c| a + b + c }.each_cons(2).count { |a, b| b > a }
# end
