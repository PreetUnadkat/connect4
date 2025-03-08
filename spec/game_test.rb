require 'rspec'
require_relative '../lib/game.rb'

describe Game do
  describe '#play_round' do
    it 'calls the play method on each player' do
      game = Game.new
      player = double('player', number: 1, play: 1)
      game.instance_variable_set(:@players, [player])
      game.instance_variable_set(:@game_status, nil)
      puts game.instance_variable_get(:@players)
      game.play_round
      expect(player).to have_received(:play)
    end
    it 'calls the update_board method on the board' do
      game = Game.new
      player = double('player', number: 1, play: 1)
      game.instance_variable_set(:@players, [player])
      game.instance_variable_set(:@game_status, nil)
      game.play
      expect(@game_status).to eq(nil)
    end
    it 'calls the update_board method on the board' do
      game = Game.new
      player = double('player', number: 1, play: 1)
      game.instance_variable_set(:@players, [player])
      game.instance_variable_set(:@game_status, nil)
      game.play
      game.play
      game.play
      game.play
      expect(@game_status).to eq(1)
    end
  end
end