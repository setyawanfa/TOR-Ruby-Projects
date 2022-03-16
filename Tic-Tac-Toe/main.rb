require './Board.rb'
require './Player.rb'

WINNING = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
pos =["x","o","x","o","o","x","o","x","x"]

class game
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
       if turn.even?
        return player1
       else
        return player2
       end  
    end
    def checkInput(input)
        if 
    end
    def playGame()
    while !game do
        play = switchplayer
        puts "possible moves are : #{board.possibleMoves}"
        puts "#{play.name} puts the sign on : "
        input = gets.chomp
        turn += 1
    end
    end
    end
end



# test = Board.new()
# puts "Enter Player 'x' name : "
# player = gets.chomp
# player = "lambert"  
# player1 = Player.new(player,'x')
# # puts "Enter Player 'o' name : "
# # player = gets.chomp
# player = "home"
# player2 = Player.new(player,'o')

# puts "#{player1.name} as 'x' vs #{player2.name} as 'o' "

# puts "#{test.possibleMoves}"

# test.positions = ["x","o","x","o","o","x","o","x","x"]

# puts "#{test.possibleMoves}"
 
# puts "#{test.fullboard?}" 






