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

end
