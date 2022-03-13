# frozen_string_literal: true

require_relative 'board'

class Chess
  attr_reader :board

  def initialize
    @board = Board.new
  end

  def toggle_player
    @board.toggle_player
  end
end
