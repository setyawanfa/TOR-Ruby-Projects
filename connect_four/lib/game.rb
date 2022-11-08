# frozen_string_literal: true

require_relative('./Board')
require_relative('./Player')
require_relative('./Messages')

# Game class is used to execute the connect four game
class Game
  attr_accessor :board, :player1, :player2, :game, :turn

  def initialize
    @board  = Board.new
    players = Messages.player_entry
    @player1 = Player.new(players[0], 'x')
    @player2 = Player.new(players[1], 'o')
    @game = false
    @turn = 0
  end

  def switchplayer
    @turn.even ? player1 : player2
  end

  def play_game

  end

end
