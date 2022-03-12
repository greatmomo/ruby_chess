# frozen_string_literal: true

require_relative '../lib/board'

describe Rook do
  describe '#initialize' do
    # check if valid moves array exists?
    context 'default rook' do
      subject(:rook_init) { described_class.new(board = Board.new, [7, 0], 'white') }
      
      it 'color is white' do
        expect(rook_init.instance_variable_get(:@color)).to eq('white')
      end
    end

    context 'black rook' do
      subject(:rook_init) { described_class.new(board = Board.new, [0, 7], 'black') }

      it 'color is black' do
        expect(rook_init.instance_variable_get(:@color)).to eq('black')
      end
    end
  end

  describe '#set_valid_moves' do
    describe 'for a white rook' do
      subject(:rook_move) { described_class.new(board = Board.new, [2, 3], 'white') }

      context "white rook at 2,3" do
        it 'can move to 10 spaces and capture 1' do
          rook_move.set_valid_moves
          expect(rook_move.instance_variable_get(:@valid_moves)).to include([2, 4],[2, 5],[2, 2],
          [0, 3],[1, 3],[3, 3],[4, 3],[5, 3],[6, 3],[7, 3])
          expect(rook_move.instance_variable_get(:@valid_captures)).to include([2, 6])
        end
      end
    end

    describe 'for a black rook' do
      subject(:rook_move) { described_class.new(board = Board.new, [6, 5], 'black') }

      context "black rook at 6,5" do
        it 'can move to 10 spaces and capture 1' do
          rook_move.set_valid_moves
          expect(rook_move.instance_variable_get(:@valid_moves)).to include([6, 4],[6, 3],[6, 2],
            [0, 5],[1, 5],[2, 5],[3, 5],[4, 5],[5, 5],[7, 5])
          expect(rook_move.instance_variable_get(:@valid_captures)).to include([6, 1])
        end
      end
    end
  end

  describe '#to_s' do
    context 'rook is white' do
      subject(:rook_string) { described_class.new(board = Board.new, [3, 1], 'white') }

      it 'has the white rook symbol' do
        expect(rook_string.to_s).to eql('♜'.gray)
      end
    end

    context 'rook is black' do
      subject(:rook_string) { described_class.new(board = Board.new, [3, 6], 'black') }

      it 'has the black rook symbol' do
        expect(rook_string.to_s).to eql('♜'.black)
      end
    end
  end
end