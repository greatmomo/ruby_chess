# frozen_string_literal: true

require_relative 'piece'

class Knight < Piece
  attr_reader :moved

  @@MOVESET = [[1, 2],[2, 1],[2, -1],[1, -2],[-1, -2],[-2, -1],[-2, 1],[-1, 2]]

  def initialize(board, location, color)
    super
  end

  def to_s
    white? ? '♞'.gray : '♞'.black
  end

  def set_valid_moves
    moves = []
    file = location[0]
    rank = location[1]
    @@MOVESET.each do |vector|
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
    @@MOVESET.each do |vector|
      file_offset = file + vector[0]
      rank_offset = rank + vector[1]
      next unless file_offset.between?(0, Board::MAX) && 
                  rank_offset.between?(0, Board::MAX)
                  
      next if board.squares[file_offset][rank_offset].nil?

      if board.squares[file_offset][rank_offset].white? != white?
        moves << [file_offset, rank_offset]
      end
    end
    @valid_captures = moves
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