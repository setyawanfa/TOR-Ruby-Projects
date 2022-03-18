require './Board'
require './Player'
require 'pry'

# 
# pos =["x","o","x","o","o","x","o","x","x"]

class Game
    
    WINNING = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    attr_accessor :board, :player1, :player2, :game, :turn
    
    def initialize()
        @board = Board.new()
        puts "Enter Player 'x' name : "
        player = gets.chomp
        @player1 = Player.new(player,'o')
        puts "Enter Player 'o' name : "
        player = gets.chomp
        @player2 = Player.new(player,'x')
        @game = false
        @turn = 0;
    end

    def switchplayer
       if @turn.even?
        return player1
       else 
        return player2
       end  
    end
    
    
    
    def playGame()
    while !game do
        play = switchplayer
        puts "possible moves are : #{board.possibleMoves}"
        puts "#{play.name} puts the sign on : "
        stateInput = false
        while !stateInput do
            input = gets.chomp
            # binding.pry
            if @board.possibleMoves().include?(input.to_i)
              stateInput = true
            else
              puts "Input is wrong, please repeat"
            end
        end
        # binding.pry
        @board.positions[input.to_i] = play.sign.to_s
        @board.showBoard()
        if checkWin(play)
            @game = true
        end
        @turn += 1 
    end

    if @game
        puts "#{play.name} has win the game"
    else
        puts "draw"
    end
    end

    

    def checkWin(player)
      WINNING.any? do |combo|
        combo.all?{|pos| @board.positions[pos] == player.sign}  
    end
    end
end

game = Game.new()
game.playGame()