require "display_board"

describe DisplayBoard do

  before(:each) do
    @display_board = DisplayBoard.new

    @board = "  -----------------------------------------
10|   |   |   |   |   |   |   |   |   |   |
  -----------------------------------------
9 |   |   |   |   |   |   |   |   |   |   |
  -----------------------------------------
8 |   |   |   |   |   |   |   |   |   |   |
  -----------------------------------------
7 |   |   |   |   |   |   |   |   |   |   |
  -----------------------------------------
6 |   |   |   |   |   |   |   |   |   |   |
  -----------------------------------------
5 |   |   |   |   |   |   |   |   |   |   |
  -----------------------------------------
4 |   |   |   |   |   |   |   |   |   |   |
  -----------------------------------------
3 |   |   |   |   |   |   |   |   |   |   |
  -----------------------------------------
2 |   |   |   |   |   |   |   |   |   |   |
  -----------------------------------------
1 | O | O | O |   |   |   |   |   |   |   |
  -----------------------------------------
    1   2   3   4   5   6   7   8   9   10  "

    @board_array = [[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                    ["O", "O", "O", nil, nil, nil, nil, nil, nil, nil]]
  end

  describe "#view_board" do
    it "outputs the game board" do
      expect{@display_board.view_board(@board_array)}.to output(@board).to_stdout
    end
  end

end
