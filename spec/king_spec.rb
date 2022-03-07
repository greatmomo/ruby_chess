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
end