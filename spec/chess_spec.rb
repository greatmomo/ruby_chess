# frozen_string_literal: true

require_relative '../lib/chess'

describe Chess do
  describe '#initialize' do
    # check if board is created properly?
  end

  describe '#play_game' do
    # script function?
  end

  describe '#player_turn' do
    # Loops until valid input is entered
    subject(:game_input) { described_class.new }

    context 'when user selects a valid piece' do
      xit 'saves that piece as selected' do
        expect { game_input.player_turn }.to change { game_input.selected }.to('piecename')
      end
    end

    context 'when user selects an invalid piece' do
      xit 'returns an error message' do
        expect(game_input).to receive(:puts).with(error_message).once
      end
    end
  end

  describe '#toggle_player' do
    # this function should switch current_player between black and white when a valid move is made
    subject(:game_input) { described_class.new }

    it 'toggles from white to black' do
      expect { game_input.toggle_player }.to change { game_input.board.white_to_move }.from(true).to(false)
    end

    context 'toggle twice to go from black to white' do
      it 'toggles from black to white' do
        game_input.toggle_player
        expect { game_input.toggle_player }.to change { game_input.board.white_to_move }.from(false).to(true)
      end
    end
  end

  describe '#player_input' do
    # Located inside #play_game (Public Script Method)
    # Looping Script Method -> Test the behavior of the method

    # Selection is valid if the tile exists on the board (a-h/1-8)
    subject(:game_input) { described_class.new }

    context 'when the input is valid' do
      before do
        valid_input = 'E5'
        allow(game_input).to receive(:gets).and_return(valid_input)
      end

      it 'stops loop and does not display error message' do
        error_message = "Input error! Please enter a value between a1 and h8 in chess notation."
        expect(game_input).not_to receive(:puts).with(error_message)
        game_input.player_input
      end
    end

    context 'when the user enters two letters, then a valid tile' do
      before do
        invalid_input = 'bC'
        valid_input = 'b7'
        allow(game_input).to receive(:gets).and_return(invalid_input, valid_input)
      end

      it 'completes loop and displays error message once' do
        error_message = "Input error! Please enter a value between a1 and h8 in chess notation."
        expect(game_input).to receive(:puts).with(error_message).once
        game_input.player_input
      end
    end

    context 'when the user enters two numbers, then a valid tile' do
      before do
        invalid_input = '72'
        valid_input = 'A2'
        allow(game_input).to receive(:gets).and_return(invalid_input, valid_input)
      end

      it 'completes loop and displays error message once' do
        error_message = "Input error! Please enter a value between a1 and h8 in chess notation."
        expect(game_input).to receive(:puts).with(error_message).once
        game_input.player_input
      end
    end

    context 'when the user enters two values outside the range, then a valid tile' do
      before do
        invalid_input1 = 'Z2'
        invalid_input2 = 'e0'
        valid_input = 'C6'
        allow(game_input).to receive(:gets).and_return(invalid_input1, invalid_input2, valid_input)
      end

      it 'completes loop and displays error message once' do
        error_message = "Input error! Please enter a value between a1 and h8 in chess notation."
        expect(game_input).to receive(:puts).with(error_message).once
        game_input.player_input
      end
    end

    context 'when the user enters more than two values, then a valid tile' do
      before do
        invalid_input = 'aBcD'
        valid_input = 'h8'
        allow(game_input).to receive(:gets).and_return(invalid_input, valid_input)
      end

      it 'completes loop and displays error message once' do
        error_message = "Input error! Please enter a value between a1 and h8 in chess notation."
        expect(game_input).to receive(:puts).with(error_message).once
        game_input.player_input
      end
    end

    context 'when the user enters a valid value' do
      before do
        valid_input = 'h8'
        allow(game_input).to receive(:gets).and_return(valid_input)
      end

      it 'gets the correct [file, rank] array' do
        expect(game_input.player_input).to eq([7, 7])
      end
    end
  end

  describe '#verify_selection' do
    # Located inside #play_game (Looping Script Method)
    # Query Method -> Test the return value
    subject(:game_input) { described_class.new }

    context 'when given a selectable tile' do
      it 'returns valid input' do
        valid_input = [1, 1]
        expect { game_input.verify_selection(valid_input) }.to change { game_input.selected }.from([]).to([1, 1])
      end
    end

    context 'when given a tile with no piece' do
      it 'no valid input' do
        invalid_input = [3, 2]
        expect { game_input.verify_selection(invalid_input) }.not_to change { game_input.selected }
      end
    end

    context 'when given a tile with the wrong color' do
      it 'no valid input' do
        invalid_input = [7, 6]
        expect { game_input.verify_selection(invalid_input) }.not_to change { game_input.selected }
      end
    end
  end

  describe '#verify_movement' do
    # Located inside #play_game (Looping Script Method)
    # Query Method -> Test the return value
    subject(:game_input) { described_class.new }

    context 'when a valid move' do
      it 'returns true' do
        game_input.instance_variable_set(:@selected, [1, 1])
        valid_input = [1, 3]
        expect(game_input.verify_movement(valid_input)).to be true
      end
    end

    context 'when given a valid capture' do
      it 'returns true' do
        game_input.board.squares[2][2] = BlackRook.new(game_input.board, [2, 2])
        game_input.board.set_moves_and_captures
        game_input.instance_variable_set(:@selected, [1, 1])
        valid_input = [2, 2]
        expect(game_input.verify_movement(valid_input)).to be true
      end
    end

    context 'when given an invalid move' do
      it 'returns false' do
        game_input.instance_variable_set(:@selected, [1, 1])
        invalid_input = [7, 6]
        expect(game_input.verify_movement(invalid_input)).to be false
      end
    end

    context 'when given a capture of an allied piece' do
      it 'returns false' do
        game_input.board.squares[3][5] = BlackRook.new(game_input.board, [3, 5])
        game_input.board.set_moves_and_captures
        game_input.instance_variable_set(:@selected, [2, 6])
        valid_input = [3, 5]
        expect(game_input.verify_movement(valid_input)).to be false
      end
    end
  end

  describe '#check?' do
    # when a move is made, check if it is check
    subject(:game_input) { described_class.new }

    context 'when it is not check' do
      xit 'returns false' do
        expect(game_input.check?).to be false
      end
    end

    context 'when it is check' do
      before do
        # make it be check
      end

      xit 'returns true' do
        expect(game_input.check?).to be true
      end
    end
  end

  describe '#checkmate?' do
    # when a move is check, check if it is checkmate
    subject(:game_input) { described_class.new }

    context 'when it is not check' do
      xit 'returns false' do
        expect(game_input.checkmate?).to be false
      end
    end

    context 'when it is check' do
      before do
        # make it be checkmate
      end

      xit 'returns true' do
        expect(game_input.checkmate?).to be true
      end
    end
  end
end
