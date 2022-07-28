# frozen_string_literal: false
require 'expect'
require 'pry'
require 'json'
# Module FileInputOutput is used to access the data from `.txt` file to generate the word in hangman game
# TODO
# read and write game progress
module FileInputOutput
  def word_generator
    filename = 'lib/google-10000-english-no-swears.txt'
    # chomp: true used to delete character '\n' for each word
    file = IO.readlines(filename, chomp: true)
    #    binding.pry
    # filter out word with length less than 5 and more than 12 letters
    filtered = file.reject { |n| n.length < 5 || n.length > 12 }
    filtered.sample
  end

  def save_json(save)
    puts 'Save filename :'
    filename = gets.chomp
    filepath = "./saves/#{filename}.json"
    File.open(filepath, 'w') { |f| f.puts save }
  end

  def read_json(filename)
    file = File.read(filename)
    JSON.parse(file)
  end

  def list_all_saves
    files = Dir['./saves/*.json']
    if !files.nil?
      # print all files including number
    else
      puts 'There is no save file'
    end
  end
end
