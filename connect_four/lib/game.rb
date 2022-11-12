# frozen_string_literal: true

require_relative('./board')
require_relative('./player')
require_relative('./messages')
require_relative('./visual')

# 00 is still in Game
# 01 is a player winning
# 10 is draw game 
# Game class is used to execute the connect four game
class Game
  attr_accessor :board, :player1, :player2, :game, :turn
  
  include Visual
  include Messages
  GRID = /^[0-6]$/.freeze
  BIN = Hash[true => '1', false => '0'].freeze
  def initialize
    @board = Board.new
    @player1 = Player.new(player_entry('x'), 'x')
    @player2 = Player.new(player_entry('o'), 'o')
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
    check = true
    until check == false
      column = input_validation.to_i
      check = @board.column_full?(column)
      column_full(column) unless check
    end
    column
  end

  def define_winning(select)
    if select == '01'
      winner_exist(switchplayer.name)
    else
      draw
    end
  end

  def play_game
    until @game == '01' || @game == '10'
      @turn += 1
      @board.place_checkers(column_validation, switchplayer.symbol)
      display_board(@board.grid)
      @game = BIN[@board.full?] + BIN[@board.any_winning?(switchplayer.symbol)]
    end

    define_winning(@game)
  end
end
