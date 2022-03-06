# frozen_string_literal: true

require_relative '../lib/board'

describe Board do
  describe '#initialize' do
    # needs to build a board with the required squares and all the expected pieces
    context 'has a white pawn in the correct position' do
      subject(:board_init) { described_class.new }

      it 'should have a white pawn at [1][1]' do
        expect(board_init.squares[1][1]).to be_kind_of(WhitePawn)
      end
    end

    context 'has a black pawn in the correct position' do
      subject(:board_init) { described_class.new }

      it 'should have a black pawn at [1][6]' do
        expect(board_init.squares[6][6]).to be_kind_of(BlackPawn)
      end
    end
  end
end
