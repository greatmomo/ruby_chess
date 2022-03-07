# frozen_string_literal: true

require_relative '../lib/board'

describe Pawn do
  describe '#initialize' do
    # check if valid moves array exists?
    context 'default pawn' do
      subject(:pawn_init) { described_class.new(board = Board.new, [1, 1], 'white') }
      
      it 'color is white' do
        expect(pawn_init.instance_variable_get(:@color)).to eq('white')
      end
    end

    context 'black pawn' do
      subject(:pawn_init) { described_class.new(board = Board.new, [3, 6], 'black') }

      it 'color is black' do
        expect(pawn_init.instance_variable_get(:@color)).to eq('black')
      end
    end
  end

  describe '#set_valid_moves' do
    describe 'for a white pawn' do
      subject(:pawn_move) { described_class.new(board = Board.new, [0, 1], 'white') }

      context "white pawn hasn't moved" do
        it 'can double move straight' do
          expect(pawn_move.set_valid_moves(1)).to include([0, 2],[0, 3])
        end
      end

      context "white pawn has moved" do
        before do
          pawn_move.instance_variable_set(:@moved, true)
        end

        it "can't double move straight" do
          expect(pawn_move.set_valid_moves(1)).to include([0, 2])
        end
      end
    end

    describe 'for a black pawn' do
      subject(:pawn_move) { described_class.new(board = Board.new, [5, 6], 'black') }

      context "black pawn hasn't moved" do
        it 'can double move straight' do
          expect(pawn_move.set_valid_moves(-1)).to include([5, 5],[5, 4])
        end
      end

      context "black pawn has moved" do
        before do
          pawn_move.instance_variable_set(:@moved, true)
        end

        it "can't double move straight" do
          expect(pawn_move.set_valid_moves(-1)).to include([5, 5])
        end
      end
    end
  end

  describe '#set_valid_captures' do
    describe 'white pawn' do
      subject(:pawn_capture) { described_class.new(board = Board.new, [5, 5], 'white') }

      context "white pawn attack moves" do
        it 'either up diagonal' do
          expect(pawn_capture.set_valid_captures(1)).to include([6, 6],[4, 6])
        end
      end
    end

    describe 'black pawn' do
      subject(:pawn_capture) { described_class.new(board = Board.new, [3, 2], 'black') }

      context "black pawn attack moves" do
        it 'either down diagonal' do
          expect(pawn_capture.set_valid_captures(-1)).to include([2, 1],[4, 1])
        end
      end
    end
  end

  describe '#has_moved' do
    subject(:pawn_move) { described_class.new(board = Board.new, [3, 1], 'white') }

    context 'pawn is moved' do
      it 'updates the moved variable to true' do
        expect { pawn_move.has_moved }.to change { pawn_move.has_moved? }.to true
      end
    end
  end

  describe '#to_s' do
    context 'pawn is white' do
      subject(:pawn_string) { described_class.new(board = Board.new, [3, 1], 'white') }

      it 'has the white pawn symbol' do
        expect(pawn_string.to_s).to eql('♟'.gray)
      end
    end

    context 'pawn is black' do
      subject(:pawn_string) { described_class.new(board = Board.new, [3, 6], 'black') }

      it 'has the black pawn symbol' do
        expect(pawn_string.to_s).to eql('♟'.black)
      end
    end
  end
end
