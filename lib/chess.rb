# frozen_string_literal: true

require_relative 'board'

class Chess
  attr_reader :board, :selected

  def initialize
    @board = Board.new
    @selected = []
  end

  def toggle_player
    @board.toggle_player
  end

  def player_input
    input = gets.chomp
    return [input[0].downcase.ord - 97, input[1].to_i - 1] if input.length == 2 &&
                                                          input[0] =~ /[A-Ha-h]/ &&
                                                          input[1] =~ /[1-8]/

    puts 'Input error! Please enter a value between a1 and h8 in chess notation.'
  end
  
  def square_get(input)
    # helper function, because this gets typed so much
    @board.squares[input[0]][input[1]] if input.length == 2
  end

  def verify_selection(input)
    unless square_get(input).nil?
      if (square_get(input).white? == @board.white_to_move) && selected == []
        @selected = [input[0], input[1]]
        return true
      end
    end
    false
  end

  def verify_movement(input)
    return false if @selected == []

    return true if square_get(@selected).valid_moves.include?(input) ||
                   square_get(@selected).valid_captures.include?(input)

    false
  end

  def make_move(input)
    @board.squares[input[0]][input[1]] = @board.squares[@selected[0]][@selected[1]].dup
    @board.squares[@selected[0]][@selected[1]] = nil
  end
end
