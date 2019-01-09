class SetBoard

  attr_reader :game_board

  def initialize(width = 12, height = 12)
    @width = width
    @height = height
    @game_board = []
  end

  def create_board()
    col_pos = row_pos = 1
    board_row = []

    while col_pos <= @width do
      while row_pos <= @height do
        board_row.push(" ")
        row_pos += 1
      end
      @game_board.push(board_row)
      col_pos += 1
      row_pos = 1
      board_row = []
    end
    @game_board
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
