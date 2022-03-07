# frozen_string_literal: true

require_relative 'piece'

class Knight < Piece
  attr_reader :moved

  def initialize(board, location, color)
    super
  end

  def to_s
    white? ? '♞'.gray : '♞'.black
  end
end

class WhiteKnight < Knight
  def initialize(board, location)
    super(board, location, 'white')
  end
end

class BlackKnight < Knight
  def initialize(board, location)
    super(board, location, 'black')
  end
end