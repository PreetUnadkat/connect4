require 'rspec'
require_relative '../lib/player.rb'

describe Player do
  describe '#play' do
    it 'returns the column number' do
      player = Player.new('John')
      allow(player).to receive(:gets).and_return('1')
      expect(player.play).to eq(1)
    end
  end
end