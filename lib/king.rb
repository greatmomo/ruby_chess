# frozen_string_literal: true

require_relative 'piece'

class King < Piece
  attr_reader :moved

  def initialize(board, location, color)
    super
  end

  def to_s
    white? ? '♚'.gray : '♚'.black
  end

  def set_valid_moves
    moves = []
    file = location[0]
    rank = location[1] + 1 * dir
    unless has_moved?
      moves << [file, rank + 1 * dir] if board.squares[file][rank + 1 * dir].nil? &&
                                         board.squares[file][rank].nil?
    end
    moves << [file, rank] if rank.between?(0, Board::MAX) && board.squares[file][rank].nil?
    @valid_moves = moves
  end

  def set_valid_captures
    moves = []
    file = location[0]
    rank = location[1] + 1 * dir
    unless board.squares[file + 1][rank].nil? 
      moves << [file + 1, rank] if board.squares[file - 1][rank].white? != white?
    end
    unless board.squares[file - 1][rank].nil? 
      moves << [file - 1, rank] if board.squares[file - 1][rank].white? != white?
    end
    @valid_captures = moves
  end
end

class WhiteKing < King
  def initialize(board, location)
    super(board, location, 'white')
  end
end

class BlackKing < King
  def initialize(board, location)
    super(board, location, 'black')
  end
end