require_relative 'board'

class Game
  def initialize
    @players = []
    @board = Board.new
  end

  def add_player(name)
    player = Player.new(name, @players.length + 1)
    @players << player
  end

  def play_round
    @players.each do |player|
      selected_col=player.play
      @board.update_board(selected_col, player.number)
    end
  end
  def over?
    @board.full?
  end
end