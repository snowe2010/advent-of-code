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

def play_bingo(inputs, boards)
  found = false
  winning_boards = []
  inputs.each do |bingo_option|
    break if found

    indexes_to_delete = []
    (0...boards.size).each do |board_index|
      boards[board_index].each do |row|
        row.each_with_index do |elem, i|
          row[i] = true if elem == bingo_option
        end
      end
      next unless check_board_win(boards[board_index])

      sum = boards[board_index].flatten.reject { |i| i == true }.map(&:to_i).sum
      winning_boards << [sum * bingo_option.to_i, boards[board_index]]
      indexes_to_delete << board_index
    end
    indexes_to_delete.sort.reverse.each do |i|
      boards.delete_at(i)
    end
    found = true if boards.empty?
  end
  winning_boards
end

execute(1) do |lines|
  input = lines[0].split(',')
  boards = create_boards lines
  play_bingo(input, boards)[0][0]
end

execute(2) do |lines|
  input = lines[0].split(',')
  boards = create_boards lines
  play_bingo(input, boards)[-1][0]
end
