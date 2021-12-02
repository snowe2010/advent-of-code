# frozen_string_literal: true

require_relative '../helpers/input_reader'

execute(1) do |lines|
  hp = 0
  depth = 0
  lines.map(&:split).each do |dir, amount|
    a=amount.to_i
    hp += a if dir == 'forward'
    depth -= a if dir == 'up'
    depth += a if dir == 'down'
  end
  [hp, depth]
end

# execute(2) do |lines|
# lines.map(&:to_i).each_cons(3).map { |a, b, c| a + b + c }.each_cons(2).count { |a, b| b > a }
# end
