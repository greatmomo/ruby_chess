# frozen_string_literal: true

require_relative 'piece'

class Pawn < Piece
  def initialize(color = 'white')
    @color = color
  end
end
