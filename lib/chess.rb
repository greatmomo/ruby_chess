# frozen_string_literal: true

require_relative 'board'

class Chess
  attr_reader :board, :selected

  def initialize
    @board = Board.new
    @selected = []
    @skip = false
    @checkmate = false
    @white_check = false
    @black_check = false
    @previous = []
  end

  def toggle_player
    @board.toggle_player
  end

  def play_game
    player_turn until @checkmate

    puts "#{@board.to_s}"
    puts "Checkmate! #{board.white_to_move ? "Black" : "White"} wins!"
  end

  def player_turn
    puts "#{@board.to_s}"
    puts "#{@board.white_to_move ? "White" : "Black"}'s turn!"
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
      @previous = @selected.map(&:clone)
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
      if (@white_check && !@board.white_to_move) || (@black_check && @board.white_to_move)
        # In the event of self check, undo that move and toggle the active player back
        undo_move(input, @previous)
        @board.toggle_player
      else
        puts "That's check! White = #{@white_check}, Black = #{@black_check}"
        puts "Current player = #{@board.white_to_move ? 'white' : 'black'}"
        @checkmate = true if checkmate?
        @board.set_moves_and_captures
      end
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

  def undo_move(current, old)
    @board.squares[old[0]][old[1]] = @board.squares[current[0]][current[1]].dup
    @board.squares[old[0]][old[1]].location = [old[0], old[1]]

    @board.squares[old[0]][old[1]].undo_moved if (@board.squares[old[0]][old[1]].color == 'white' &&
                                                 old[1] == 1) || (old[1] == 6 &&
                                                 @board.squares[old[0]][old[1]].color == 'black')

    @board.squares[current[0]][current[1]] = nil
  end

  def check?
    @white_check = false
    @black_check = false
    @board.squares.each do |file|
      file.each do |piece|
        if piece
          piece.valid_captures.each do |location|
            @black_check = true if piece.white? && @board.squares[location[0]][location[1]].is_a?(BlackKing)

            @white_check = true if !piece.white? && @board.squares[location[0]][location[1]].is_a?(WhiteKing)
          end
        end
      end
    end
    return true if @black_check || @white_check

    false
  end

  def checkmate?
    # copy the board state
    # test each possible move for the current player to see if it removes check
    @board.squares.each do |file|
      file.each do |piece|
        if piece
          puts "This piece is being tested for checkmate fixing: #{piece}"
          if (@board.white_to_move == piece.white?) && @white_check
            return false if check_moves(piece, 'white')

          end
          if (!@board.white_to_move == !piece.white?) && @black_check
            return false if check_moves(piece, 'black')

          end
        end
      end
    end
    true
  end

  def check_moves(piece, color)
    piece.valid_moves.each do |move|
      @selected = [piece.location[0], piece.location[1]]
      previous = @selected.map(&:clone)
      make_move(move)
      @board.set_moves_and_captures
      unless check? && (color == 'white' ? @white_check : @black_check)
        undo_move(move, previous)
        @board.set_moves_and_captures
        return true
      end
      undo_move(move, previous)
      @board.set_moves_and_captures
    end

    piece.valid_captures.each do |move|
      @selected = [piece.location[0], piece.location[1]]
      previous = @selected.map(&:clone)
      make_move(move)
      @board.set_moves_and_captures
      unless check? && (color == 'white' ? @white_check : @black_check)
        undo_move(move, previous)
        @board.set_moves_and_captures
        return true
      end
      undo_move(move, previous)
      @board.set_moves_and_captures
    end
    false
  end
end

chess = Chess.new
chess.play_game

