# frozen_string_literal: true

require_relative '../lib/direction'
require_relative '../lib/rook'
require_relative '../lib/board'

describe Direction do
  describe '#direction_scan' do
    # check if valid moves array exists?
    context 'straights' do
      it 'returns two proper arrays' do
        expect(Direction.direction_scan(Direction.straights, Board.new, [5, 4], "white")[0]).to include(
          [5, 5],[5, 3],[5, 2],[0, 4],[1, 4],[2, 4],[3, 4],[4, 4],[6, 4],[7, 4])
        expect(Direction.direction_scan(Direction.straights, Board.new, [5, 4], "white")[1]).to include(
          [5, 6])
      end
    end
  end
end