# frozen_string_literal: true

require_relative '../lib/board'

describe Board do
  describe '#initialize' do
    # needs to build a board with the required squares and all the expected pieces
    context 'pawns' do
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

    context 'rooks' do
      context 'has a white rook in the correct position' do
        subject(:board_init) { described_class.new }
  
        it 'should have a white rook at [0][0]' do
          expect(board_init.squares[0][0]).to be_kind_of(WhiteRook)
        end
      end
  
      context 'has a black rook in the correct position' do
        subject(:board_init) { described_class.new }
  
        it 'should have a black rook at [7][7]' do
          expect(board_init.squares[7][7]).to be_kind_of(BlackRook)
        end
      end
    end

    context 'knights' do
      context 'has a white knight in the correct position' do
        subject(:board_init) { described_class.new }
  
        it 'should have a white knight at [1][0]' do
          expect(board_init.squares[1][0]).to be_kind_of(WhiteKnight)
        end
      end
  
      context 'has a black knight in the correct position' do
        subject(:board_init) { described_class.new }
  
        it 'should have a black knight at [6][7]' do
          expect(board_init.squares[6][7]).to be_kind_of(BlackKnight)
        end
      end
    end
  end

  context 'bishops' do
    context 'has a white bishop in the correct position' do
      subject(:board_init) { described_class.new }

      it 'should have a white bishop at [2][0]' do
        expect(board_init.squares[2][0]).to be_kind_of(WhiteBishop)
      end
    end

    context 'has a black bishop in the correct position' do
      subject(:board_init) { described_class.new }

      it 'should have a black bishop at [5][7]' do
        expect(board_init.squares[5][7]).to be_kind_of(BlackBishop)
      end
    end
  end

  context 'queen' do
    context 'has a white queen in the correct position' do
      subject(:board_init) { described_class.new }

      it 'should have a white queen at [3][0]' do
        expect(board_init.squares[3][0]).to be_kind_of(WhiteQueen)
      end
    end

    context 'has a black queen in the correct position' do
      subject(:board_init) { described_class.new }

      it 'should have a black queen at [3][7]' do
        expect(board_init.squares[3][7]).to be_kind_of(BlackQueen)
      end
    end
  end

  context 'king' do
    context 'has a white king in the correct position' do
      subject(:board_init) { described_class.new }

      it 'should have a white king at [4][0]' do
        expect(board_init.squares[4][0]).to be_kind_of(WhiteKing)
      end
    end

    context 'has a black king in the correct position' do
      subject(:board_init) { described_class.new }

      it 'should have a black king at [4][7]' do
        expect(board_init.squares[4][7]).to be_kind_of(BlackKing)
      end
    end
  end
end
