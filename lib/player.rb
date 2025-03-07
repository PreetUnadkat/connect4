class Player
  attr_accessor :name, :number
  def initialize(name, number)
    @name = name
    @number = number
  end
  def play
    puts "number #{@number},\n#{@name}, enter a column number:"
    column = gets.chomp.to_i
    column
  end
end