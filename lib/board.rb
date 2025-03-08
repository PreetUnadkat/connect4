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
    check_over(row, column)
  end
  def check_over(row, column)
    return false if row < 0
  
    directions = [
      [0, 1],  # Horizontal
      [1, 0],  # Vertical
      [1, 1],  # Diagonal (\)
      [1, -1]  # Diagonal (/)
    ]
  
    directions.each do |dx, dy|
      count = 1
  
      (-3..3).each do |i|
        next if i.zero?
  
        x = row + i * dx
        y = column - 1 + i * dy
  
        next if x < 0 || x >= 6 || y < 0 || y >= 7
  
        if @grid[x][y] == @grid[row][column - 1] && @grid[x][y] != 0
          count += 1
          return @grid[row][column - 1] if count == 4
        else
          count = 1
        end
      end
    end
  
    nil
  end
  
end