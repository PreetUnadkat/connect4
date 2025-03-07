require 'rspec'
require_relative '../lib/board.rb'

describe Board do
  describe '#initialize' do
    it 'creates a 6x7 grid full of .s' do
      board = Board.new
      expect(board.grid).to eq([[0, 0, 0, 0, 0, 0, 0],
                                [0, 0, 0, 0, 0, 0, 0],
                                [0, 0, 0, 0, 0, 0, 0],  
                                [0, 0, 0, 0, 0, 0, 0],
                                [0, 0, 0, 0, 0, 0, 0],
                                [0, 0, 0, 0, 0, 0, 0]])
    end
  end
  describe '#print_board' do
    it 'prints the board' do
      board = Board.new
      expect { board.print_board }.to output(". . . . . . . \n. . . . . . . \n. . . . . . . \n. . . . . . . \n. . . . . . . \n. . . . . . . \n").to_stdout
    end
  end

  describe '#update_board' do
    describe 'when the column is empty' do
      it 'updates with single move' do
        board = Board.new
        expect { board.update_board(1, 1) }.to change { board.grid[5][0] }.from(0).to(1)
      end
      it 'updates with multiple move' do
        board = Board.new

        board.update_board(2, 1)

        expect { board.update_board(1, 1) }.to change { board.grid[5][0] }.from(0).to(1)
      end
    end
    describe 'when the column is not empty' do
      it 'updates the board with the player_2\'s move' do
        board = Board.new

        board.update_board(1, 1)
        board.update_board(1, 1)
        expect { board.update_board(1, 2) }.to change { board.grid[3][0] }.from(0).to(2)
      end
    end
  end
end