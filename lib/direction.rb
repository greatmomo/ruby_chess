# frozen_string_literal: true

module Direction
  # unit vectors in all directions
  @@straights = [[0, 1], [1, 0], [0, -1], [-1, 0]]
  @@diagonals = [[1, 1], [1, -1], [-1, -1], [-1, 1]]
  # queen and king need both
  @@omni = @@straights + @@diagonals

  def self.omni
    @@omni
  end

  def self.straights
    @@straights
  end

  def self.diagonals
    @@diagonals
  end

  # w/ rook, bishop, queen make a function that scans
  # the directions til end of board or piece
  def self.direction_scan(direction, board, location, color)
    movement = capture = []
    direction.each do |vector|
      file = location[0] + vector[0]
      rank = location[1] + vector[1]
      while file.between?(0, Board::MAX) && 
            rank.between?(0, Board::MAX) && 
            board.squares[file][rank].nil?
        movement += [[file,rank]]
        file += vector[0]
        rank += vector[1]
      end

    end
    return movement, capture
  end
end
