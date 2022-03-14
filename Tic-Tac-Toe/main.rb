require './Board.rb'
require './Player.rb'

WINNING = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
pos =["x","o","x","o","o","x","o","x","x"]


test = Board.new()
puts "Enter Player 'x' name : "
player = gets.chomp  
player1 = Player.new(player,'x')
puts "Enter Player 'o' name : "
player = gets.chomp
player2 = Player.new(player,'o')


puts "#{player1.name} as 'x' vs #{player2.name} as 'o' "
# test.positions = pos
# test.showBoard





