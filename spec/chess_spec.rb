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

    xit 'toggles from white to black' do
      expect { game_input.toggle_player }.to change { game_input.current_player }.from('white').to('black')
    end

    context 'toggle twice to go from black to white' do
      before do
        game_input.toggle_player
      end

      xit 'toggles from black to white' do
        expect { game_input.toggle_player }.to change { game_input.current_player }.from('black').to('white')
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

      xit 'stops loop and does not display error message' do
        error_message = "Input error! Please enter a value between a1 and h8 in chess notation."
        expect(game_input).not_to receive(:puts).with(error_message)
        game_input.player_input(min, max)
      end
    end

    context 'when the user enters two letters, then a valid tile' do
      before do
        invalid_input = 'BC'
        valid_input = 'B7'
        allow(game_input).to receive(:gets).and_return(invalid_input, valid_input)
      end

      xit 'completes loop and displays error message once' do
        error_message = "Input error! Please enter a value between a1 and h8 in chess notation."
        expect(game_input).to receive(:puts).with(error_message).once
        game_input.player_input(min, max)
      end
    end

    context 'when the user enters two numbers, then a valid tile' do
      before do
        invalid_input = '72'
        valid_input = 'A2'
        allow(game_input).to receive(:gets).and_return(invalid_input, valid_input)
      end

      xit 'completes loop and displays error message once' do
        error_message = "Input error! Please enter a value between a1 and h8 in chess notation."
        expect(game_input).to receive(:puts).with(error_message).once
        game_input.player_input(min, max)
      end
    end
  end

  describe '#verify_input' do
    # Located inside #play_game (Looping Script Method)
    # Query Method -> Test the return value
    subject(:game_input) { described_class.new }

    context 'when given a selectable tile' do
      xit 'returns valid input' do
        valid_input = 'B2'
        expect(game_input.verify_input(valid_input)).to eq('B2')
      end
    end

    context 'when given invalid input as argument' do
      xit 'returns nil' do
        invalid_input = '11'
        expect(game_input.verify_input(invalid_input)).to be_nil
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
