# frozen_string_literal: true
#
require_relative('../lib/Board')

describe Board do
  subject(:board) { described_class.new }
  describe '#possibleMoves' do

    context 'when anypossible moves exist' do
      before do
        board.instance_variable_set(:@positions, [" "," "," ","o"," "," ","x"," "," "] )
      end

      it 'exist vaild move' do
        avail = board.possibleMoves
        expect(avail.count).to be >= 0
      end
    end
    context 'when no possible moves' do
      before do
        board.instance_variable_set(:@positions, ["o","x","o","o","x","x","x","x","x"] )
      end

      it 'the is no more move' do
        avail = board.possibleMoves
        expect(avail.count).to eq(0)
      end
    end

  describe '#fullboard?'
    context 'not full board' do
      before do
        board.instance_variable_set(:@positions, [" "," "," ","o"," "," ","x"," "," "] )
      end
      it 'throwing false' do
        expect(board.fullboard?).to be_falsy
      end
    end
    context 'full board' do
      before do
        board.instance_variable_set(:@positions, ["o","x","o","o","x","x","x","x","x"] )
      end
      it 'throwing true' do
        expect(board.fullboard?).to be_truthy
      end
    end
  end
end
