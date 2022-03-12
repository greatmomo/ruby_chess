# frozen_string_literal: true

class Piece
  attr_reader :valid_moves, :valid_captures, :board, :color
  attr_accessor :location

  def initialize(board, location, color)
    @board = board
    @location = location
    @color = color
    @valid_moves = []
    @valid_captures = []
  end

  def white?
    color == 'white'
  end
end
