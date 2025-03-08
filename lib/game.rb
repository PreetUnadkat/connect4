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
      if @game_status!=nil
        end_screen
        break
      end
      loop do
        selected_col = player.play
        @game_status = @board.update_board(selected_col, player.number)
        @board.print_board
        puts @game_status
        break if (selected_col>0 && selected_col<8) && (@game_status!=false)
      end
    end
  end
  def play
    puts "Enter player names:"
    2.times do |i|
      print "Player #{i + 1} name: "
      name = gets.chomp
      add_player(name)
    end
    while @game_status.nil?
      play_round
    end
  end
  def end_screen
    if @game_status == 1
      puts "Player 1 wins!"
    elsif @game_status == 2
      puts "Player 2 wins!"
    else
      puts "It's a draw!"
    end
  end
end
game=Game.new
game.play
# it 'calls the play method on each player' do
#   game = Game.new
#   player = double('player', play: 1)
#   allow(player).to receive(:play)
#   game.instance_variable_set(:@players, [player])
#   game.play_round
#   expect(player).to have_received(:play)
# end