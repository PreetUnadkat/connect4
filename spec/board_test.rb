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
    describe 'when the column is full (edge case)' do
      it 'raises an error' do
        board = Board.new
        6.times do
          board.update_board(1, 1)
        end
        expect { board.update_board(1, 1) }.to raise_error("Column is full")
      end
    end
  end
  describe '#check_over' do
    describe 'when not over' do
      it 'returns nil' do
        board = Board.new
        expect(board.check_over(5, 1)).to eq(nil)
      end
      it 'returns nil' do
        board = Board.new
        board.update_board(1, 1)
        board.update_board(1, 1)
        board.update_board(1, 1)
        board.update_board(2, 1)
        board.update_board(2, 1)
        board.update_board(2, 1)
        board.update_board(3, 1)
        expect(board.check_over(5, 1)).to eq(nil)
      end
    end
    describe 'when over' do
      it 'returns 1' do
        board = Board.new
        board.update_board(1, 1)
        board.update_board(1, 1)
        board.update_board(1, 1)
        board.update_board(1, 1)
        expect(board.check_over(5, 1)).to eq(1)
      end
      it 'returns 1' do
        board = Board.new
        board.update_board(1, 1)
        board.update_board(2, 1)
        board.update_board(3, 1)
        board.update_board(4, 1)
        expect(board.check_over(5, 1)).to eq(1)
      end
      it 'returns 1' do
        board = Board.new
        board.update_board(1, 1)
        board.update_board(2, 1)
        board.update_board(3, 1)
        board.update_board(4, 1)
        expect { board.print_board }.to output(". . . . . . . \n. . . . . . . \n. . . . . . . \n. . . . . . . \n. . . . . . . \n1 1 1 1 . . . \n").to_stdout
      end
    end
  end
end
