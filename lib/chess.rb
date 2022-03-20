# frozen_string_literal: true

require_relative 'board'

class Chess
  attr_reader :board, :selected

  def initialize
    @board = Board.new
    @selected = []
    @skip = false
    @checkmate = false
  end

  def toggle_player
    @board.toggle_player
  end

  def play_game
    player_turn until @checkmate

    puts "#{board.to_s}"
    puts "Checkmate! #{board.white_to_move ? "Black" : "White"} wins!"
  end

  def player_turn
    puts "#{board.to_s}"
    puts "#{board.white_to_move ? "White" : "Black"}'s turn!"
    input = []
    puts "Select a piece: "
    while 1
      input = player_input
      next unless input

      if verify_selection(input)
        break
      else
        puts "Please select a #{board.white_to_move ? "white" : "black"} piece with valid moves"
      end
    end

    puts "Select a destination: "
    while 1
      input = player_input
      next unless input

      if verify_movement(input)
        break
      else
        puts "Please select a valid location to move to, or press q to deselect this piece"
      end
    end

    unless @skip
      make_move(input)
      @selected = []
      @board.set_moves_and_captures
      @board.toggle_player
    else
      @selected = []
      @skip = false
    end

    # if check, do a thing?
    if check?
      puts "That's check!"
      @checkmate = true if checkmate?
    end
  end

  def player_input
    input = gets.chomp
    return input if input == 'Q' || input == 'q'
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
    if input == 'q' || input == 'Q'
      @skip = true
      return true
    end

    return false if @selected == []

    return true if @board.squares[selected[0]][selected[1]].valid_moves.include?(input) ||
                   @board.squares[selected[0]][selected[1]].valid_captures.include?(input)

    false
  end

  def make_move(input)
    @board.squares[input[0]][input[1]] = @board.squares[@selected[0]][@selected[1]].dup
    @board.squares[input[0]][input[1]].location = [input[0], input[1]]
    @board.squares[input[0]][input[1]].has_moved if @board.squares[input[0]][input[1]].is_a?(Pawn) &&
                                                    !@board.squares[input[0]][input[1]].has_moved?

    @board.squares[@selected[0]][@selected[1]] = nil
  end

  def check?
    @board.squares.each do |file|
      file.each do |piece|
        if piece
          piece.valid_captures.each do |location|
            return true if piece.white? && @board.squares[location[0]][location[1]].is_a?(BlackKing)

            return true if !piece.white? && @board.squares[location[0]][location[1]].is_a?(WhiteKing)
          end
        end
      end
    end
    false
  end

  def checkmate?
    # copy the board state
    # test each possible move for the current player to see if it removes check

    # how do I avoid the player putting themselves in check?
    # if moved yourself into check, undo the last move?
    # make a revert_move function that does the opposite of make move and toggles back
    # would need to store the last move
    false
  end
end

# chess = Chess.new
# chess.play_game
