# frozen_string_literal: true

require_relative 'color'
require_relative 'pawn'
require_relative 'rook'
require_relative 'knight'
require_relative 'bishop'
require_relative 'queen'
require_relative 'king'

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
    squares[1][0] = WhiteKnight.new(self, [1, 0])
    squares[6][0] = WhiteKnight.new(self, [6, 0])
    squares[2][0] = WhiteBishop.new(self, [2, 0])
    squares[5][0] = WhiteBishop.new(self, [5, 0])
    squares[3][0] = WhiteQueen.new(self, [3, 0])
    squares[4][0] = WhiteKing.new(self, [4, 0])
    8.times { |i| squares[i][1] = WhitePawn.new(self, [i, 1]) }
    squares[0][7] = BlackRook.new(self, [0, 7])
    squares[7][7] = BlackRook.new(self, [7, 7])
    squares[1][7] = BlackKnight.new(self, [1, 7])
    squares[6][7] = BlackKnight.new(self, [6, 7])
    squares[2][7] = BlackBishop.new(self, [2, 7])
    squares[5][7] = BlackBishop.new(self, [5, 7])
    squares[3][7] = BlackQueen.new(self, [3, 7])
    squares[4][7] = BlackKing.new(self, [4, 7])
    8.times { |i| squares[i][6] = BlackPawn.new(self, [i, 6]) }
  end

  def set_moves_and_captures
    # this should calculate for every piece
    squares.each do |file|
      file.each do |piece|
        if piece
          piece.set_valid_moves
          piece.set_valid_captures
        end
      end
    end
  end

  def toggle_player
    @white_to_move = !@white_to_move
  end

  def to_s
    output = "  A B C D E F G H\n".blue
    (7).downto(0).each do |rank|
      output += "#{rank + 1} ".blue
      (0..7).each do |file|
        if file % 2 == 0
          if rank % 2 == 0
            output += "#{squares[file][rank].nil? ? " " : "#{squares[file][rank]}"} "
          else
            output += "#{squares[file][rank].nil? ? " " : "#{squares[file][rank]}"}".bg_blue
            output += " ".bg_blue
          end
        else
          if rank % 2 == 0
            output += "#{squares[file][rank].nil? ? " " : "#{squares[file][rank]}"}".bg_blue
            output += " ".bg_blue
          else
            output += "#{squares[file][rank].nil? ? " " : "#{squares[file][rank]}"} "
          end
        end
      end
      output += " #{rank + 1}".blue
      output += "\n"
    end
    output += "  A B C D E F G H".blue
  end
end

# board = Board.new
# puts "#{board.to_s}"
