# frozen_string_literal:true

require 'pry'
require 'pry-nav'
# Board is defined to be called in Game class
class Board
  attr_accessor :grid

  COLUMNS = 7
  ROW = 6
  def initialize
    @grid = Array.new(COLUMNS) { Array.new(ROW) }
  end

  def place_checkers(col, char)
    @grid[col][grid[col].index {|x| x.nil?}] = char
  end

  def column_full?(col)
    grid[col].count(nil).zero?
  end

  def full?
    a = grid.map { |col| col.count(nil) }
    a.all?(0)
  end

  def horizontal_winning?(char, row = 0, grid_copy = @grid)
    return false if row == 6 
    return true if grid_copy.transpose[row].each_cons(4).any? { |col| col.all?(char) }

    horizontal_winning?(char, row += 1)
  end

  def vertical_winning?(char, column = 0)
    return false if column == 7

    return true if grid[column].each_cons(4).any? { |row| row.all?(char) }

    vertical_winning?(char, column += 1)
  end

  def right_diagonal(char, column = 0, row = 0)
    return (0..3).all? { |inc| grid[column + inc][row + inc] == char }
    # return grid[column][row]==char && grid[column + 1][row + 1] == char && grid[column + 2][row + 2] == char && grid[column + 3][row + 3] == char
  end

  def left_diagonal(char, column = 0, row = 3)
    return (0..3).all? { |inc| grid[column + inc][row - inc] == char }
  end
  # diagonal iterate between column 0 to column 3, row 0 to row 2 for the bottom right direction
  # diagonal interate between column 3 to column 6, row 0 to row 2 for the bottom left direction
  # diagonal winning should create two different function for each direction

  def diagonal_winning?(char, column = 0, row = 0)
    return false if row == 3
    return true if right_diagonal(char, column, row) || left_diagonal(char, column, row + 3)

    if column == 3
      diagonal_winning?(char, column = 0, row += 1)
    else
      diagonal_winning?(char, column += 1, row)
    end
  end
 
  def any_winning?(char)
    diagonal_winning?(char) | vertical_winning?(char) | horizontal_winning?(char)
  end
 
end
