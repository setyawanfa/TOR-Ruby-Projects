# frozen_string_literal:true

module Messages

  def player_entry(char)
    puts "enter player '#{char}' name: "
    player = gets.chomp
  end

  def asking_input(player)
    puts "#{player.name} turn to put their token"
    puts 'enter number between 0 and 6:'
    token = gets.chomp
  end

  def column_full(col)
    puts "The column in #{col} is full"
    puts "Please enter another column"
  end

  def winner_exist(player)
    puts "Player #{player} have win the game"
  end

  def draw
    puts 'Draw'
    puts 'There is no winner in the game'
  end
end
