# frozen_string_literal: true

# Player is defined to be called in Game class
class Player
  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end
