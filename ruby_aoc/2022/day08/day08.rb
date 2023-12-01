# frozen_string_literal: true

require 'pp'
require_relative '../helpers/input_reader'

class Tree
  attr_accessor :height, :visible

  def initialize(height, visible)
    @height = height
    @visible = visible
  end

  def to_s
    "Height: #{height} Visible: #{visible}"
  end

  def inspect
    to_s
  end
end

def are_trees_smaller?(arr, height)
  arr.all? { |tree| tree.height < height }
end

def check_grid_for_visible_trees_on_a_row(grid)
  grid_width = grid[0].size
  grid_height = grid.size

  # integer_grid = lines.map { |line| line.chars.map(&:to_i) }

  grid.each_with_index do |row, row_index|
    row.each_with_index do |tree, column_index|
      puts
      # pp integer_grid
      puts
      if row_index == 0 || row_index == grid_height - 1 || column_index == 0 || column_index == grid_width - 1
        tree.visible = true
        next
      end
      height = tree.height

      puts "Current Tree #{tree}"
      # check current row
      left_of_tree = row[0...column_index]
      puts "Checking left of Tree #{left_of_tree}"
      if are_trees_smaller?(left_of_tree, height)
        tree.visible = true
        puts "Tree is visible from the left #{tree}"
        next
      end
      right_of_tree = row[column_index + 1..grid_width]
      puts "Checking right of Tree #{right_of_tree}"
      if are_trees_smaller?(right_of_tree, height)
        tree.visible = true
        puts "Tree is visible from the right #{tree}"
        next
      end
    end
  end
end

# execute(1) do |lines|
#   grid = lines.map { |line| line.chars.map(&:to_i).map { |i| Tree.new(i, false) } }
#   check_grid_for_visible_trees_on_a_row grid
#   check_grid_for_visible_trees_on_a_row grid.transpose
#   grid.sum { |row| row.count { |tree| tree.visible } }
# end

def count_trees_to_the_left(grid,x,y,height)
  row = grid[y]
  return 0 if x == 0
  x.downto(0).sum do |tree_x|
    if row[tree_x].height <= height
      1
    else
      0
    end
  end
end

def count_visible_trees_from_index(grid, x, y)

  grid_width = grid[0].size
  grid_height = grid.size

  current_tree = grid[y][x]
  current_tree_height = current_tree.height
  puts "Current Tree: #{current_tree}"
  pp count_trees_to_the_left grid, x, y, current_tree_height
end

execute(2, true) do |lines|
  grid = lines.map { |line| line.chars.map(&:to_i).map { |i| Tree.new(i, false) } }

  integer_grid = lines.map { |line| line.chars.map(&:to_i) }
  pp integer_grid
  grid.each_with_index do |row, row_index|
    row.each_with_index do |tree, column_index|
      count_visible_trees_from_index(grid, column_index, row_index)
    end
  end

end
