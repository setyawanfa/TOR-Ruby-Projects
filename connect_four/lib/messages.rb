# frozen_string_literal:true

module Messages
  def player_entry
    p "enter player 'x' name: "
    player1 = gets.chomp
    p "enter player 'o' name: "
    player2 = gets.chomp
    return player1, player2
  end
end
