class Board
  attr_reader :grid   
  def initialize
    @grid=Array.new(6) { Array.new(7, 0) }
  end
  def print_board
    @grid.each do |row|
      row.each do |cell|
        print cell == 0 ? '.' : cell
        print ' '
      end
      puts
    end
  end
  def update_board(column, player)
    row = 5
    while row >= 0
      if @grid[row][column-1] == 0
        @grid[row][column-1] = player
        break
      end
      row -= 1
    end
  end
end