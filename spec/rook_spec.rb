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

  # for rook, need some kind of directional scanning function
  # pass a vector to it (ex. [1,1]), and have it scan in that direction
  # until finding a piece or end of board
  # so in [1,1] case, while [conditions] add +1 to temp rank and file vars
  # queen would scan [0,1],[1,1],[1,0],[0,-1],[-1,-1],[-1,0],[1,-1],[-1,1]
end