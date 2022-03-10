# frozen_string_literal: true

require_relative '../lib/direction'

describe Direction do
  describe '#direction_scan' do
    # check if valid moves array exists?
    context 'straights' do
      
      it 'returns two arrays' do
        expect(Direction.direction_scan).to eq([[[0,0],[0,1]],[[0,2]]])
      end
    end
  end
end