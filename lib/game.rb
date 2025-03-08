require_relative 'board'
require_relative 'player'
class Game
  def initialize
    @players = []
    @board = Board.new
    @game_status
  end

  def add_player(name)
    player = Player.new(name, @players.length + 1)
    @players << player
  end

  def play_round
    @players.each do |player|
      selected_col = nil
      loop do
        selected_col = player.play
        @game_status = @board.update_board(selected_col, player.number)
        break if (selected_col>0 && selected_col<8) && (@game_status!=false)
      end
    end
  end
  def play
    while @game_status.nil?
      play_round
    end
  end
end