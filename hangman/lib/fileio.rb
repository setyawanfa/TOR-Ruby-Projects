require 'expect'
require 'pry'
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
end
