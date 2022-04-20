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
    elsif input.match(/[0-1]{4}/)
      status = true
    else
      puts 'Input must only contains 0 or 1'
    end
    status
  end

  def check_answer(input)
    # return true if input.to_i == @answer
    inp = input.chars.to_a
    ans = @answer.chars.to_a
    check = []
    inp.each_index { |idx| check[idx] = inp[idx] == ans[idx] ? 1 : 0 }
    # binding.pry
    eval_player_input(check)
    check.uniq.count == 1
  end

  def eval_player_input(check)
    check.each_index { |idx| puts "entry in #{idx + 1} is wrong" if check[idx].zero? }
  end

  def play_game
    until @game
      puts 'Player guess :'
      input_state = false
      puts @answer
      until input_state
        input = gets.chomp
        input_state = check_input(input)
      end
      @game = check_answer(input)
    end
    puts 'you win'
  end
end
