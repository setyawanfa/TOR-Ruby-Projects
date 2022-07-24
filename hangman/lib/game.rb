require_relative 'visual'
require_relative 'fileio'
require 'pry'
# Hangman class is consist of data type and method that used in hangman game
# The hangman class will call all the output from Visual Module
class Hangman
  attr_accessor :word, :available_letters, :solved_letters, :incorrect_letters, :attempt

  include Visual
  include FileInputOutput

  def initialize
    @available_letters = ('a'..'z').to_a
    # @word = word_generator.split(//)
    @word = 'angle'.split(//)
    @attempt = 0
    @solved_letters = []
    @incorrect_letters = []
    welcome
    play
  end

  def game_over?
    (@attempt == 7) || (@word.uniq.sort == @solved_letters.sort)
  end

  def input_validation(input)
    feedback = false
    if input.match?(/[^a-z]/)
      puts 'Input is not letter'
    elsif input.length > 1
      puts 'Input is only one letter'
    elsif @solved_letters.include?(input) || @incorrect_letters.include?(input)
      puts 'Input have been used'
    else
      feedback = true
    end
    feedback
  end

  def word_validation(input)
    if @word.include?(input)
      @attempt += 0
      @solved_letters << input
    else
      @attempt += 1
      @incorrect_letters << input
      # binding.pry
    end
    @available_letters.delete(input)
  end

  def play
    until game_over?
      puts showing_word(@word, @solved_letters, @incorrect_letters)
      input = gets.chomp
      # binding.pry
      word_validation(input) if input_validation(input.downcase)
      visualize(@attempt)
    end
    if @attempt == 7
      visualize(@attempt)
      puts 'You lose'
    else
      visualize(10)
      puts 'You win'
    end
  end
end
