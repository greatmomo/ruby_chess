# frozen_string_literal: true

require_relative '../lib/board'

describe Bishop do
  describe '#initialize' do
    # check if valid moves array exists?
    context 'default bishop' do
      subject(:bishop_init) { described_class.new(board = Board.new, [5, 0], 'white') }
      
      it 'color is white' do
        expect(bishop_init.instance_variable_get(:@color)).to eq('white')
      end
    end

    context 'black bishop' do
      subject(:bishop_init) { described_class.new(board = Board.new, [2, 7], 'black') }

      it 'color is black' do
        expect(bishop_init.instance_variable_get(:@color)).to eq('black')
      end
    end
  end

  describe '#set_valid_moves' do
    describe 'for a white bishop' do
      subject(:bishop_move) { described_class.new(board = Board.new, [2, 3], 'white') }

      context "white bishop at 2,3" do
        it 'can move to 10 spaces and capture 1' do
          bishop_move.set_valid_moves
          expect(bishop_move.instance_variable_get(:@valid_moves)).to include([1, 4],[0, 5],[3, 4],[4, 5],[1, 2],[3, 2])
          expect(bishop_move.instance_variable_get(:@valid_captures)).to include([5, 6])
        end
      end
    end

    describe 'for a black bishop' do
      subject(:bishop_move) { described_class.new(board = Board.new, [6, 5], 'black') }

      context "black bishop at 6,5" do
        it 'can move to 10 spaces and capture 1' do
          bishop_move.set_valid_moves
          expect(bishop_move.instance_variable_get(:@valid_moves)).to include([5, 4],[4, 3],[3, 2],[7, 4])
          expect(bishop_move.instance_variable_get(:@valid_captures)).to include([2, 1])
        end
      end
    end
  end

  describe '#to_s' do
    context 'bishop is white' do
      subject(:bishop_string) { described_class.new(board = Board.new, [3, 1], 'white') }

      it 'has the white bishop symbol' do
        expect(bishop_string.to_s).to eql('♝'.gray)
      end
    end

    context 'bishop is black' do
      subject(:bishop_string) { described_class.new(board = Board.new, [3, 6], 'black') }

      it 'has the black bishop symbol' do
        expect(bishop_string.to_s).to eql('♝'.black)
      end
    end
  end
end