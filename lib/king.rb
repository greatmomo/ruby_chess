# frozen_string_literal: true

require_relative 'piece'
require_relative 'direction'

class King < Piece
  include Direction

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
    rank = location[1]
    Direction.omni.each do |vector|
      file_offset = file + vector[0]
      rank_offset = rank + vector[1]
      if file_offset.between?(0, Board::MAX) && 
         rank_offset.between?(0, Board::MAX) && 
         board.squares[file_offset][rank_offset].nil?
        moves << [file_offset, rank_offset]
      end
    end
    @valid_moves = moves
  end

  def set_valid_captures
    moves = []
    file = location[0]
    rank = location[1]
    Direction.omni.each do |vector|
      file_offset = file + vector[0]
      rank_offset = rank + vector[1]
      next if board.squares[file_offset][rank_offset].nil?

      if board.squares[file_offset][rank_offset].white? != white?
        moves << [file_offset, rank_offset]
      end
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
