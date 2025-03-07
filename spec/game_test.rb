require 'rspec'
require_relative '../lib/game.rb'

describe Game do
  describe '#play' do
    it 'calls the play method on each player' do
      game = Game.new
      player = double('player')
      allow(player).to receive(:play)
      game.add_player(player)
      game.play
      expect(player).to have_received(:play)
    end
    it 'calls the update_board method on the board' do
      game = Game.new
      player = double('player', column: 1, number: 1)
      allow(player).to receive(:play)
      game.add_player(player)
      game.play
      expect(game.board.grid[5][0]).to eq(1)
    end
  end
end