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
        expect(pawn_move.valid_moves).to include([0,1],[0,2])
      end
    end

    context "pawn has moved" do
      before do
        pawn_move.instance_variable_set(:@moved, true)
      end

      it "can't double move straight" do
        expect(pawn_move.valid_moves).to include([0,1])
      end
    end
  end

  describe '#attack_moves' do
    subject(:pawn_attack) { described_class.new }

    context "pawn attack moves" do
      it 'either diagonal' do
        expect(pawn_attack.attack_moves).to include([1,1],[-1,1])
      end
    end
  end

  describe '#move' do
    subject(:pawn_move) { described_class.new }

    context 'pawn is moved' do
      it 'updates the moved variable to true' do
        expect { pawn_move.move }.to change { pawn_move.moved }.to true
      end
    end
  end

  describe '#symbol' do
    context 'pawn is white' do
      subject(:pawn_symbol) { described_class.new }

      it 'has the white pawn symbol' do
        expect(pawn_symbol.symbol).to eq('♙')
      end
    end

    context 'pawn is black' do
      subject(:pawn_symbol) { described_class.new('black') }

      it 'has the black pawn symbol' do
        expect(pawn_symbol.symbol).to eq('♟︎')
      end
    end
  end

  # how do we check for attacks for pawns?
  # redesign to take a board and check for enemy positions and such
end
