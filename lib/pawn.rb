# frozen_string_literal: true

require_relative 'piece'

class Pawn < Piece
  attr_reader :moved, :symbol

  def initialize(color = 'white')
    @color = color
    @symbol = @color == 'white' ? '♙' : '♟︎'
  end

  def valid_moves
    return [[0, 1], [0, 2]] unless @moved

    [[0, 1]]
  end

  def attack_moves
    [[1, 1], [-1, 1]]
  end

  def move
    @moved ||= true
  end
end
