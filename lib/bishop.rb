# frozen_string_literal: true

require_relative 'piece'

class Bishop < Piece
  attr_reader :moved

  def initialize(board, location, color)
    super
  end

  def to_s
    white? ? '♝'.gray : '♝'.black
  end

  def set_valid_moves
    @valid_moves, @valid_captures = Direction.direction_scan(Direction.diagonals, board, location, color)
  end

  def set_valid_captures
    # handled by set_valid_moves
  end
end

class WhiteBishop < Bishop
  def initialize(board, location)
    super(board, location, 'white')
  end
end

class BlackBishop < Bishop
  def initialize(board, location)
    super(board, location, 'black')
  end
end