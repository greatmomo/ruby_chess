# frozen_string_literal: true

require_relative '../lib/direction'
require_relative '../lib/rook'
require_relative '../lib/board'

describe Direction do
  describe '#direction_scan' do
    context 'straights' do
      it 'returns two proper arrays' do
        expect(Direction.direction_scan(Direction.straights, Board.new, [5, 4], "white")[0]).to include(
          [5, 5],[5, 3],[5, 2],[0, 4],[1, 4],[2, 4],[3, 4],[4, 4],[6, 4],[7, 4])
        expect(Direction.direction_scan(Direction.straights, Board.new, [5, 4], "white")[1]).to include(
          [5, 6])
      end
    end

    context 'diagonals' do
      it 'returns two proper arrays' do
        expect(Direction.direction_scan(Direction.diagonals, Board.new, [2, 3], "black")[0]).to include(
          [1, 4],[0, 5],[3, 4],[4, 5],[3, 2],[1, 2])
        expect(Direction.direction_scan(Direction.diagonals, Board.new, [2, 3], "black")[1]).to include(
          [0, 1],[4, 1])
      end
    end

    context 'both' do
      it 'returns two proper arrays' do
        expect(Direction.direction_scan(Direction.omni, Board.new, [4, 4], "white")[0]).to include(
          [3, 5],[4, 5],[5, 5],[0, 4],[1, 4],[2, 4],[3, 4],[5, 4],[6, 4],[7, 4],[3, 3],
          [4, 3],[5, 3],[2, 2],[4, 2],[6, 2])
        expect(Direction.direction_scan(Direction.omni, Board.new, [4, 4], "white")[1]).to include(
          [2, 6],[4, 6],[6, 6])
      end
    end
  end
end