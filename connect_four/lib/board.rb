# frozen_string_literal:true

require 'pry'
require 'pry-nav'
# Board is defined to be called in Game class
class Board
  attr_accessor :grid

  COLUMNS = 7
  ROW = 6
  GRID = /^[0-6]$/.freeze
  def initialize
    @grid = Array.new(COLUMNS) { Array.new(ROW) }
  end

  def place_checkers(col, char)
    grid[col][grid[col].index(nil)] = char
  end

  def valid_input?(col, pattern)
    col.match?(pattern)
  end
  # given the column return the boolean

  def column_full?(col)
    grid[col].count(nil).zero?
  end

  def full?
    a = grid.map { |col| col.count(nil) }
    a.all?(0)
  end

  def horizontal_winning?(char, row = 0)
    return false if row == 6

    return true if grid.transpose[row].each_cons(4).any? { |c| c.all?(char) }

    horizontal_winning?(char, row += 1)
  end

  def vertical_winning?(char, column = 0)
    return false if column == 7

    return true if grid[column].each_cons(4).any? { |c| c.all?(char) }

    vertical_winning?(char,column += 1)
  end
end
