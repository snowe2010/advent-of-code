# frozen_string_literal: true

require 'pp'
require_relative '../helpers/input_reader'

def create_boards(lines)
  boards = [[]]
  current_board = 0
  lines.drop(2).map do |line|
    if line == ''
      current_board += 1
      boards[current_board] = []
      next
    end
    boards[current_board] << line.split
  end
  boards
end

def check_board_win(board)
  row_true = board.any? do |row|
    row.all? { |i| i == true }
  end
  column_true = board.transpose.any? do |column|
    column.all? { |i| i == true }
  end
  row_true || column_true
end

# puts "testing fake board"
# fake_board_row_win = [[true, true, true], [false, false, false], [false, false, false]]
# fake_board_column_win = [[true, false, false], [true, false, false], [true, false, false]]
# fake_board_diagonal_win = [[true, false, false], [false, true, false], [false, false, true]]
# fake_board_loss = [[false, true, false], [true, false, false], [false, false, true]]
# p check_board_win(fake_board_row_win)
# p check_board_win(fake_board_column_win)
# p check_board_win(fake_board_diagonal_win)
# p check_board_win(fake_board_loss)
# test = [["14", "21", true, "24", true],
#         ["10", "16", "15", true, "19"],
#         ["18", "8", true, "26", "20"],
#         ["22", true, "13", "6", true],
#         ["2", "0", "12", "3", true]]
# p check_board_win(test)
# puts "testing fake board done"

execute(1) do |lines|
  input = lines[0].split(',')
  p input
  boards = create_boards lines
  found = nil

  input.each do |bingo_option|
    break if found
    boards.each do |board|
      break if found
      board.each do |row|
        row.each_with_index do |elem, i|
          row[i] = true if elem == bingo_option
        end
      end
      if check_board_win(board)
        puts "board won!"
        pp board
        sum = board.flatten.reject { |i| i == true }.map(&:to_i).sum
        p sum * bingo_option.to_i
        found = sum * bingo_option.to_i
      end
    end
  end
end

# execute(2) do |lines|
# end
