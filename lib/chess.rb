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

  def play_game
    player_turn

    puts "#{board.to_s}"
    puts "Checkmate! #{board.white_to_move ? "White" : "Black"} wins!"
  end

  def player_turn
    puts "#{board.to_s}"
    # puts player_prompt
    input = []
    while 1
      input = player_input
      if verify_selection(input)
        break
      else
        puts "Please select a #{board.white_to_move ? "white" : "black"} piece with valid moves"
      end
    end

    while 1
      input = player_input
      if verify_movement(input)
        break
      else
        puts "Please select a valid location to move to, or press q to deselect this piece"
      end
    end

    puts "input = #{input}"
    make_move(input)
    @selected = []

    # if check, do a thing?
    # unless checkmate, switch players
  end

  def player_input
    input = gets.chomp
    return [input[0].downcase.ord - 97, input[1].to_i - 1] if input.length == 2 &&
                                                          input[0] =~ /[A-Ha-h]/ &&
                                                          input[1] =~ /[1-8]/

    puts 'Input error! Please enter a value between a1 and h8 in chess notation.'
  end

  def verify_selection(input)
    unless @board.squares[input[0]][input[1]].nil?
      if (@board.squares[input[0]][input[1]].white? == @board.white_to_move) && selected == [] &&
        (@board.squares[input[0]][input[1]].valid_moves.length +
         @board.squares[input[0]][input[1]].valid_captures.length > 0)
        @selected = [input[0], input[1]]
        return true
      end
    end
    false
  end

  def verify_movement(input)
    return false if @selected == []

    return true if @board.squares[selected[0]][selected[1]].valid_moves.include?(input) ||
                   @board.squares[selected[0]][selected[1]].valid_captures.include?(input)

    false
  end

  def make_move(input)
    @board.squares[input[0]][input[1]] = @board.squares[@selected[0]][@selected[1]].dup
    @board.squares[@selected[0]][@selected[1]] = nil
  end
end

chess = Chess.new
chess.play_game
