# frozen_string_literal: true

require_relative 'pawn'
require_relative 'rook'

class Board
  attr_reader :squares, :white_to_move
  MAX = 7

  def initialize
    @squares = []
    @white_to_move = true
    8.times { |i| @squares[i] = [] }
    fill_board
    set_moves_and_captures
  end

  def fill_board
    squares[0][0] = WhiteRook.new(self, [0, 0])
    squares[7][0] = WhiteRook.new(self, [7, 0])
    # squares[1][0] = WhiteKnight.new(self, [1, 0])
    # squares[6][0] = WhiteKnight.new(self, [6, 0])
    # squares[2][0] = WhiteBishop.new(self, [2, 0])
    # squares[5][0] = WhiteBishop.new(self, [5, 0])
    # squares[3][0] = WhiteQueen.new(self, [3, 0])
    # squares[4][0] = WhiteKing.new(self, [4, 0])
    8.times { |i| squares[i][1] = WhitePawn.new(self, [i, 1]) }
    squares[0][7] = BlackRook.new(self, [0, 7])
    squares[7][7] = BlackRook.new(self, [7, 7])
    # squares[1][7] = BlackKnight.new(self, [1, 7])
    # squares[6][7] = BlackKnight.new(self, [6, 7])
    # squares[2][7] = BlackBishop.new(self, [2, 7])
    # squares[5][7] = BlackBishop.new(self, [5, 7])
    # squares[3][7] = BlackQueen.new(self, [3, 7])
    # squares[4][7] = BlackKing.new(self, [4, 7])
    8.times { |i| squares[i][6] = BlackPawn.new(self, [i, 6]) }
  end

  def set_moves_and_captures
    # this should calculate for every piece
  end
end
