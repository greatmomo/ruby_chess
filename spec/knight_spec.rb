# frozen_string_literal: true

require_relative '../lib/board'

describe Knight do
  describe '#initialize' do
    # check if valid moves array exists?
    context 'default knight' do
      subject(:knight_init) { described_class.new(board = Board.new, [6, 0], 'white') }
      
      it 'color is white' do
        expect(knight_init.instance_variable_get(:@color)).to eq('white')
      end
    end

    context 'black knight' do
      subject(:knight_init) { described_class.new(board = Board.new, [1, 7], 'black') }

      it 'color is black' do
        expect(knight_init.instance_variable_get(:@color)).to eq('black')
      end
    end
  end

  describe '#set_valid_moves' do
    describe 'for a white knight' do
      subject(:knight_move) { described_class.new(board = Board.new, [6, 5], 'white') }

      context "white knight at 6,5" do
        it 'can move to 3 spaces' do
          expect(knight_move.set_valid_moves).to include([4, 4],[5, 3],[7, 3])
        end
      end
    end

    describe 'for a black knight' do
      subject(:knight_move) { described_class.new(board = Board.new, [1, 7], 'black') }

      context "black knight at 1,7" do
        it 'can move to 2 spaces' do
          expect(knight_move.set_valid_moves).to include([0, 5],[2, 5])
        end
      end
    end
  end

  describe '#set_valid_captures' do
    describe 'white knight' do
      subject(:knight_capture) { described_class.new(board = Board.new, [6, 5], 'white') }

      context "white knight attack moves" do
        it 'can attack up, 3 spaces' do
          expect(knight_capture.set_valid_captures).to include([4, 6],[5, 7],[7, 7])
        end
      end
    end

    describe 'black knight' do
      subject(:knight_capture) { described_class.new(board = Board.new, [1, 7], 'black') }

      context "black knight attack moves" do
        it 'no attacks' do
          expect(knight_capture.set_valid_captures).to include([])
        end
      end
    end
  end

  describe '#to_s' do
    context 'knight is white' do
      subject(:knight_string) { described_class.new(board = Board.new, [3, 1], 'white') }

      it 'has the white knight symbol' do
        expect(knight_string.to_s).to eql('♞'.gray)
      end
    end

    context 'knight is black' do
      subject(:knight_string) { described_class.new(board = Board.new, [3, 6], 'black') }

      it 'has the black knight symbol' do
        expect(knight_string.to_s).to eql('♞'.black)
      end
    end
  end
end