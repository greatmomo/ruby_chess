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
end