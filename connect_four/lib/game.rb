# frozen_string_literal: true

require_relative('./board')
require_relative('./player')
require_relative('messages')

# 00 is still in Game
# 01 is a player winning
# 10 is draw game 
# Game class is used to execute the connect four game
class Game
  attr_accessor :board, :player1, :player2, :game, :turn

  include Messages
  GRID = /^[0-6]$/.freeze
  BIN = Hash[true => '1', false => '0'].freeze
  def initialize
    @board = Board.new
    @player1 = player_entry('x')
    @player2 = player_entry('o')
    @game = '00' 
    @turn = 0
  end

  def switchplayer
    @turn.odd? ? player1 : player2
  end

  def valid_input?(col, pattern)
    col.match?(pattern)
  end

  def input_validation
    check = false
    until check == true
      col = asking_input(switchplayer)
      check = valid_input?(col, GRID)
    end
    col
  end

  def column_validation
    check = false
    until check == true
      column = input_validation.to_i
      check = @board.column_full?(column)
      column_full(column) unless check
    end
    column
  end

  def define_winning(select)
    if select == '01'
      winner_exist(switchplayer)
    else
      draw
    end
  end

  def play_game
    until @game == '01' || @game == '10'
      turn += 1
      @board.place_checkers(column_validation, switchplayer)
      @game = BIN[@board.full?] + BIN[@board.any_winning?(switchplayer)]
    end

    define_winning(@game)
  end
end
