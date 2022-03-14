# frozen_string_literal: true

require_relative 'piece'

class Pawn < Piece
  attr_reader :moved

  def initialize(board, location, color)
    super
    @moved = false
  end

  def to_s
    white? ? '♟'.gray : '♟'.black
  end

  def set_valid_moves(dir)
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

  def set_valid_captures(dir)
    moves = []
    file = location[0]
    rank = location[1] + 1 * dir
    if file < 7 && board.squares[file + 1][rank]
      moves << [file + 1, rank] if board.squares[file + 1][rank].white? != white?
    end
    if file > 0 && board.squares[file - 1][rank]
      moves << [file - 1, rank] if board.squares[file - 1][rank].white? != white?
    end
    @valid_captures = moves
  end

  def has_moved?
    moved
  end

  def has_moved
    @moved = true
  end
end

class WhitePawn < Pawn
  def initialize(board, location)
    super(board, location, 'white')
  end

  def set_valid_moves
    super(1)
  end

  def set_valid_captures
    super(1)
  end
end

class BlackPawn < Pawn
  def initialize(board, location)
    super(board, location, 'black')
  end

  def set_valid_moves
    super(-1)
  end

  def set_valid_captures
    super(-1)
  end
end