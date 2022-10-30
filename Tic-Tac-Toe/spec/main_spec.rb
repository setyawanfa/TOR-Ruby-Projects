# frozen_string_literal: true

require_relative '../lib/Player.rb'
require_relative '../lib/Board.rb'
require_relative '../lib/main.rb'

# the rspec is used for following files
# - lib/Player
# - lib/Board
# - lib/main
#
#

describe Game do
  subject(:game) { described_class.new() }

  before do
    game.instance_variable_set(:@board, instance_double(Board))
    game.instance_variable_set(:@player1, instance_double(Player))
    game.instance_variable_set(:@player2, instance_double(Player))
  end
  describe '#switchplayer' do
  end
end
