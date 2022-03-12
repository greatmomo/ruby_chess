# frozen_string_literal: true

require_relative 'piece'

class Rook < Piece
  attr_reader :moved

  def initialize(board, location, color)
    super
  end

  def to_s
    white? ? '♜'.gray : '♜'.black
  end

  def set_valid_moves
    
    @valid_moves
    @valid_captures
  end

  def set_valid_captures
    # handled by set_valid_moves
  end
end

class WhiteRook < Rook
  def initialize(board, location)
    super(board, location, 'white')
  end
end

class BlackRook < Rook
  def initialize(board, location)
    super(board, location, 'black')
  end
end