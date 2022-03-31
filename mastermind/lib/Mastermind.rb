require 'pry'

# Mastermind class initiated and run the mastermind function.
# Mastermind will produce randomly 4 digits binary number and the user will try to guess the right answer
class Mastermind
  attr_reader :answer
  attr_accessor :round, :game

  def initialize
    @answer = (1..4).map { [0, 1].sample }.join
    @round = 0
    @game = false
    puts 'Mastermind game has been initiated'
    puts 'Please guess 4 digits number of 0 or 1'
  end

  def check_input(input)
    status = false
    if input.length > 4 || input.length < 4
      puts 'Input must be 4 digits'
    elsif input.match('^([0-1]{4})$')
      puts 'Input must only contains 0 or 1'
    else
      status = true
    end
    status
  end

  def check_answer(input)
    return true if input.to_i == @answer

    @answer.each_with_index do |item, index|
      return false if input[index] != item
    end
  end

  def play_game
    until @game
      puts 'Player guess :'
      input_state = false
      until input_state
        input = gets.chomp
        input_state = check_input(input)
      end

    end
  end
end
