require_relative '../helpers/input_reader'

execute(1) do |lines|
  lines.map(&:to_i).each_cons(2).count { |a, b| b > a }
end

execute(2) do |lines|
  lines.map(&:to_i).each_cons(3).map { |a, b, c| a + b + c }.each_cons(2).count { |a, b| b > a }
end
