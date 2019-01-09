class SetBoard

  attr_reader :game_board

  def initialize(width = 10, height = 10)
    @width = width
    @height = height
    @game_board = []
  end

  def create_board()
    @game_board = Array.new(@width) { Array.new(@height) }
  end

  def placeShip(x,y, direction)
    @game_board = @game_board.reverse
    @game_board[y-1][x-1] = "O"
    if direction == "v"
      @game_board[y][x-1] = "O"
    elsif direction == "h"
      @game_board[y-1][x] = "O"
    end
    @game_board = @game_board.reverse
  end

end
