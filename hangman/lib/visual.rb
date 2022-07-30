require 'colorize'
# Visual module used to display the feedback given to user based on certain condition
module Visual
  def visualize(failure)
    case failure
    when 0
      puts ''
    when 1
      puts '_|_______ '.red
    when 2
      puts ' |         '.red
      puts ' |         '.red
      puts ' |         '.red
      puts '_|_______  '.red
    when 3
      puts '  _____    '.red
      puts ' /         '.red
      puts ' |         '.red
      puts ' |         '.red
      puts ' |         '.red
      puts '_|_______  '.red
    when 4
      puts '  _____    '.red
      puts ' /     |   '.red
      puts ' |         '.red
      puts ' |         '.red
      puts ' |         '.red
      puts '_|_______  '.red
    when 5
      puts '  _____    '.red
      puts ' /     |   '.red
      puts ' |     O   '.red
      puts ' |         '.red
      puts ' |         '.red
      puts '_|_______  '.red
    when 6
      puts '  _____    '.red
      puts ' /     |   '.red
      puts ' |     O   '.red
      puts ' |    /|\  '.red
      puts ' |         '.red
      puts '_|_______  '.red
    when 7
      puts '  _____    '.red
      puts ' /     |   '.red
      puts ' |     O   '.red
      puts ' |    /|\  '.red
      puts ' |    / \  '.red
      puts '_|_______  '.red
    when 10
      puts ''.blue
      puts '    O '.blue
      puts ' /\/\/ '.blue
      puts '  /  '.blue
      puts '\/\   '.blue
      puts '  /   '.blue
    end
  end

  def welcome
    puts 'Welcome to hangman game\n'
    puts 'Press one below\n'
    puts '1. Start a new game '
    puts '2. Load game'
  end

  def instruction
    puts 'during the game you can opt to save your progress and can load your progress for later'
    puts 'to save you progress you type `save`'
    puts 'to quit during the game you could type `quit`'
  end

  def start_new(word)
    "The word consist of #{word.length} character\n"
  end

  def showing_word(word, correct_guess, _wrong_guess)
    return '_' * word.length if correct_guess.nil?

    game_disp = ''
    word.each { |i| game_disp << ((correct_guess.include? i) ? i : '_') }
    game_disp
  end
end
