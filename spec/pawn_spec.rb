# frozen_string_literal: true

require_relative '../lib/pawn'

describe Pawn do
  describe '#initialize' do
    # check if valid moves array exists?
    context 'default pawn' do
      subject(:pawn_init) { described_class.new }
      
      it 'color is white' do
        expect(pawn_init.color).to eq('white')
      end
    end

    context 'black pawn' do
      subject(:pawn_init) { described_class.new('black') }

      it 'color is black' do
        expect(pawn_init.color).to eq('black')
      end
    end
  end

  describe '#valid_moves' do
    subject(:pawn_move) { described_class.new }

    context "pawn hasn't moved" do
      it 'can double move straight' do
        expect(pawn_move.valid_moves).to include([0,1],[0,2],[1,1],[-1,1])
      end
    end

    context "pawn has moved" do
      before do
        pawn_move.instance_variable_set(:@moved, true)
      end

      it "can't double move straight" do
        expect(pawn_move.valid_moves).to include([0,1],[1,1],[-1,1])
      end
    end
  end

  # how do we check for attacks for pawns?
end
