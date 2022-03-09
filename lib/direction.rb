# frozen_string_literal: true

module Direction
  # unit vectors for all directions
  straights = [0, 1],[1, 0],[0, -1],[-1, 0]
  diagonals = [1, 1],[1, -1],[-1, -1],[-1, 1]
  # queen and king need both
  omni = straights + diagonals

  # for rook, bishop, queen make a function that scans
  # the directions until end of board or piece
end