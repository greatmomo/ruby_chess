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

  # for bishop, need some kind of directional scanning function
  # pass a vector to it (ex. [1,1]), and have it scan in that direction
  # until finding a piece or end of board
  # so in [1,1] case, while [conditions] add +1 to temp rank and file vars
  # queen would scan [0,1],[1,1],[1,0],[0,-1],[-1,-1],[-1,0],[1,-1],[-1,1]
end