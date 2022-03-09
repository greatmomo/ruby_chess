# frozen_string_literal: true

require_relative '../lib/board'

describe King do
  describe '#initialize' do
    # check if valid moves array exists?
    context 'default king' do
      subject(:king_init) { described_class.new(board = Board.new, [4, 0], 'white') }
      
      it 'color is white' do
        expect(king_init.instance_variable_get(:@color)).to eq('white')
      end
    end

    context 'black king' do
      subject(:king_init) { described_class.new(board = Board.new, [4, 7], 'black') }

      it 'color is black' do
        expect(king_init.instance_variable_get(:@color)).to eq('black')
      end
    end
  end

  describe '#set_valid_moves' do
    describe 'for a white king' do
      subject(:king_move) { described_class.new(board = Board.new, [4, 5], 'white') }

      context "white king at 4,5" do
        it 'can move to 5 spaces, not up' do
          expect(king_move.set_valid_moves).to include([3, 4],[3, 5],[4, 4],[5, 4],[5, 5])
        end
      end
    end

    describe 'for a black king' do
      subject(:king_move) { described_class.new(board = Board.new, [0, 2], 'black') }

      context "black king at 0,2" do
        it 'can move to 3 spaces, not down' do
          expect(king_move.set_valid_moves).to include([0, 3],[1, 3],[1, 2])
        end
      end
    end
  end

  describe '#set_valid_captures' do
    describe 'white king' do
      subject(:king_capture) { described_class.new(board = Board.new, [4, 5], 'white') }

      context "white king attack moves" do
        it 'can attack up, 3 spaces' do
          expect(king_capture.set_valid_captures).to include([3, 6],[4, 6],[5, 6])
        end
      end
    end

    describe 'black king' do
      subject(:king_capture) { described_class.new(board = Board.new, [0, 2], 'black') }

      context "black king attack moves" do
        it 'can attack down, 2 spaces' do
          expect(king_capture.set_valid_captures).to include([0, 1],[1, 1])
        end
      end
    end
  end

  describe '#to_s' do
    context 'king is white' do
      subject(:king_string) { described_class.new(board = Board.new, [3, 1], 'white') }

      it 'has the white king symbol' do
        expect(king_string.to_s).to eql('♚'.gray)
      end
    end

    context 'king is black' do
      subject(:king_string) { described_class.new(board = Board.new, [3, 6], 'black') }

      it 'has the black king symbol' do
        expect(king_string.to_s).to eql('♚'.black)
      end
    end
  end
end