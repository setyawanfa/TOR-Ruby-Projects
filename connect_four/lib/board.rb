# frozen_string_literal:true

require 'pry'
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

  def column_full?(col)
    grid[col].count(nil).zero?
  end

  def full?
    a = grid.map { |col| col.count(nil) }
    a.all?(0)
  end
end
