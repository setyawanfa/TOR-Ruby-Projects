# frozen_string_literal:true

require_relative('../lib/board')

GRID = /^[0-6]$/.freeze

describe Board do
  describe '#place_checkers' do
    subject(:board) { described_class.new }
    it 'place to an empty column' do
      board.place_checkers(0, '%w')
      expect(board.grid[0].count(nil)).to eql(5)
    end

    context 'add checker to filled column' do
      before do
        board.place_checkers(1, '%w')
      end

      it 'filled column non nil count more than 1' do
        board.place_checkers(1, '%w')
        expect(board.grid[1].count { |e| !e.nil? }).to be > 1
      end
    end
  end

  describe '#valid_input?' do
    subject(:board) { described_class.new }
    it 'verify input is valid' do
      input = 1
      expect(board.valid_input?(input.to_s, GRID)).to be_truthy
    end

    it 'verify invalid input' do
      input = 9
      expect(board.valid_input?(input.to_s, GRID)).to be_falsy
    end
  end

  describe '#column_full?' do
    subject(:board) { described_class.new }
    before do
      board.instance_variable_set(:@grid,
                                  [['%w', '%w', '%w', '%w', '%w', '%w'],
                                   [nil, nil, nil, nil, nil, nil],
                                   [nil, nil, nil, nil, nil, nil],
                                   [nil, nil, nil, nil, nil, nil],
                                   [nil, nil, nil, nil, nil, nil],
                                   [nil, nil, nil, nil, nil, nil],
                                   [nil, nil, nil, nil, nil, nil]])
    end
    it 'return true if column is already full' do
      expect(board.column_full?(0)).to be_truthy
    end

    it 'return false if column is not full' do
      expect(board.column_full?(1)).to be_falsy
    end

    describe '#full?' do
      subject(:board) { described_class.new }
      it 'expect false when board is not full' do
        expect(board.full?).to be_falsy
      end
      context 'expect true when board is full' do
        before do
          board.instance_variable_set(:@grid,
                                      [['%w', '%w', '%w', '%w', '%w', '%w'],
                                       ['%w', '%w', '%w', '%w', '%w', '%w'],
                                       ['%w', '%w', '%w', '%w', '%w', '%w'],
                                       ['%w', '%w', '%w', '%w', '%w', '%w'],
                                       ['%w', '%w', '%w', '%w', '%w', '%w'],
                                       ['%w', '%w', '%w', '%w', '%w', '%w'],
                                       ['%w', '%w', '%w', '%w', '%w', '%w']])
        end

        it 'expect true when board is full' do
          expect(board.full?).to be_truthy
        end
      end
    end
  end

end
