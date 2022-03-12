# frozen_string_literal: true

require_relative '../lib/board'

describe Queen do
  describe '#initialize' do
    # check if valid moves array exists?
    context 'default queen' do
      subject(:queen_init) { described_class.new(board = Board.new, [3, 0], 'white') }
      
      it 'color is white' do
        expect(queen_init.instance_variable_get(:@color)).to eq('white')
      end
    end

    context 'black queen' do
      subject(:queen_init) { described_class.new(board = Board.new, [3, 7], 'black') }

      it 'color is black' do
        expect(queen_init.instance_variable_get(:@color)).to eq('black')
      end
    end
  end

  describe '#set_valid_moves' do
    describe 'for a white queen' do
      subject(:queen_move) { described_class.new(board = Board.new, [2, 3], 'white') }

      context "white queen at 2,3" do
        it 'can move to 10 spaces and capture 1' do
          queen_move.set_valid_moves
          expect(queen_move.instance_variable_get(:@valid_moves)).to include([2, 4],[2, 5],[2, 2],
          [0, 3],[1, 3],[3, 3],[4, 3],[5, 3],[6, 3],[7, 3],
          [1, 4],[0, 5],[3, 4],[4, 5],[1, 2],[3, 2])
          expect(queen_move.instance_variable_get(:@valid_captures)).to include([2, 6], [5, 6])
        end
      end
    end

    describe 'for a black queen' do
      subject(:queen_move) { described_class.new(board = Board.new, [6, 5], 'black') }

      context "black queen at 6,5" do
        it 'can move to 10 spaces and capture 1' do
          queen_move.set_valid_moves
          expect(queen_move.instance_variable_get(:@valid_moves)).to include([6, 4],[6, 3],[6, 2],
            [0, 5],[1, 5],[2, 5],[3, 5],[4, 5],[5, 5],[7, 5],
            [5, 4],[4, 3],[3, 2],[7, 4])
          expect(queen_move.instance_variable_get(:@valid_captures)).to include([2, 1],[6, 1])
        end
      end
    end
  end

  describe '#to_s' do
    context 'queen is white' do
      subject(:queen_string) { described_class.new(board = Board.new, [3, 1], 'white') }

      it 'has the white queen symbol' do
        expect(queen_string.to_s).to eql('♛'.gray)
      end
    end

    context 'queen is black' do
      subject(:queen_string) { described_class.new(board = Board.new, [3, 6], 'black') }

      it 'has the black queen symbol' do
        expect(queen_string.to_s).to eql('♛'.black)
      end
    end
  end
end