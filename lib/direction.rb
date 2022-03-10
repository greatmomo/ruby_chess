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

  # w/ rook, bishop, queen make a function that scans
  # the directions til end of board or piece
  def self.direction_scan
    movement = capture = []

    return movement, capture
  end
end
