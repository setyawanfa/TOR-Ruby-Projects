# frozen_string_literal: false

require_relative 'visual'
require_relative 'fileio'
require 'json'
require 'pry'
# Hangman class is consist of data type and method that used in hangman game
# The hangman class will call all the output from Visual Module
class Hangman
  attr_accessor :word, :available_letters, :solved_letters, :incorrect_letters, :attempt

  include Visual
  include FileInputOutput

  def initialize
    @available_letters = ('a'..'z').to_a
    @word = word_generator.split(//)
    @attempt = 0
    @solved_letters = []
    @incorrect_letters = []
    welcome
    play
  end

  def game_over?
    (@attempt == 7) || (@word.uniq.sort == @solved_letters.sort)
  end

  def detect_control(input)
    if input == 'quit'
      puts 'Good bye'
      exit 100
    elsif input == 'save'
      save_json(to_json)
    else
      input_validation(input)
    end
  end

  def input_validation(input)
    feedback = false
    if input.match?(/[^a-zA-Z]/)
      puts 'Input is not letter'
    elsif input.length > 1
      puts 'Input is only one letter per turn'
    elsif @solved_letters.include?(input) || @incorrect_letters.include?(input)
      puts 'Input have been used'
    else
      feedback = true
    end
    feedback
  end

  def word_validation(input)
    if @word.include?(input.downcase)
      @attempt += 0
      @solved_letters << input.downcase
    else
      @attempt += 1
      @incorrect_letters << input.downcase
    end
    @available_letters.delete(input.downcase)
  end

  def after_play
    if @attempt == 7
      visualize(@attempt)
      puts 'You lose'
    else
      visualize(10)
      puts 'You win'
    end
    puts 'Play again?(y/n)'
    input = gets.chomp
    Hangman.new unless input == 'n'
  end

  def to_json
    obj = ['available_letters': @available_letters,
           'word': @word,
           'attempt': @attempt,
           'solved_letters': @solved_letters,
           'incorrect_letters': @incorrect_letters]
    @progress = JSON.generate(obj)
  end

  def play
    until game_over?
      puts showing_word(@word, @solved_letters, @incorrect_letters)
      input = gets.chomp
      # binding.pry
      word_validation(input) if detect_control(input.downcase)
      visualize(@attempt)
    end
    after_play
  end
end
