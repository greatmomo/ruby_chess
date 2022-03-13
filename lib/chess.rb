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

  def player_input
    input = gets.chomp
    return [input[0].downcase.ord - 97, input[1].to_i] if input.length == 2 &&
                                                          input[0] =~ /[A-Ha-h]/ &&
                                                          input[1] =~ /[1-8]/

    puts 'Input error! Please enter a value between a1 and h8 in chess notation.'
  end
end
