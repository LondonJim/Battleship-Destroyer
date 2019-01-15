require 'set_board'

describe SetBoard do

  before(:each) do
    @set_board = SetBoard.new
  end

  it 'instantiates with a @game_board array' do
    expect(@set_board.game_board).to eq([[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                         [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                         [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                         [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                         [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                         [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                         [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                         [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                         [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                         [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]])
  end

  describe "#placeShip" do

    it 'fills array with a 2 ships' do
      @set_board.place_ship(3,1, "v")
      expect(@set_board.place_ship(2,1, "v")).to eq([[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                                    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                                    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                                    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                                    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                                    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                                    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                                    [nil, nil, 0, nil, nil, nil, nil, nil, nil, nil],
                                                    [nil, 1, 0, nil, nil, nil, nil, nil, nil, nil],
                                                    [nil, 1, 0, nil, nil, nil, nil, nil, nil, nil]])
    end

    it 'fills array with a 1x3 ship, horizontal' do
      expect(@set_board.place_ship(1,1, "h")).to eq([[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                                    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                                    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                                    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                                    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                                    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                                    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                                    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                                    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                                    [0, 0, 0, nil, nil, nil, nil, nil, nil, nil]])
    end

    it 'fills array with a 1x3 ship,  horizontal' do
      expect(@set_board.place_ship(1,1, "h")).to eq([[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                                    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                                    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                                    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                                    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                                    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                                    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                                    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                                    [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                                                    [0, 0, 0, nil, nil, nil, nil, nil, nil, nil]])
    end

    it 'warns if ship placement is out of bounds on y axis' do
      expect(@set_board.place_ship(9,1, "h")).to eq("error")
    end

    it 'warns if ship placement is out of bounds on y axis' do
      expect(@set_board.place_ship(1,9, "v")).to eq("error")
    end

    it 'warns if ship placement overlaps another ship placement vertically' do
      @set_board.place_ship(1,1, "h")
      expect(@set_board.place_ship(1,1, "v")).to eq("error")
    end

    it 'warns if ship placement overlaps another ship placement horizontally' do
      @set_board.place_ship(1,1, "v")
      expect(@set_board.place_ship(1,1, "h")).to eq("error")
    end

  end

  describe ("#placement_active") do
    it 'returns no game_board if all ships are already placed' do
      @set_board.place_ship(1,1, "v")
      @set_board.place_ship(2,1, "v")
      expect(@set_board.placement_active).to eq(false)
    end
  end

end
