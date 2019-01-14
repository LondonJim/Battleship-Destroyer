require 'set_board'

describe SetBoard do

  before(:each) do
    @set_board = SetBoard.new
  end

  it 'creates a new instantiation of SetBoard class' do
    expect(@set_board).to be_instance_of(SetBoard)
  end

  it 'instantiates with an empty @game_board array' do
    expect(@set_board.game_board).to eq([])
  end

  describe "#create_board" do

    it 'creates a 12x12 whitespace board' do
      expect(@set_board.create_board).to eq([[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
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

  end

  describe "#placeShip" do

    it 'fills array with a 2 ships' do
      @set_board.create_board
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
      @set_board.create_board
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
      @set_board.create_board
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

    it 'warns if ship placement is out of bounds on x axis' do
      @set_board.create_board
      expect{ @set_board.place_ship(8,1, "h") }.to output("Can not place ship there\n").to_stdout
    end

    it 'warns if ship placement is out of bounds on y axis' do
      @set_board.create_board
      expect{ @set_board.place_ship(1,8, "v") }.to output("Can not place ship there\n").to_stdout
    end

    it 'warns if ship placement overlaps another ship placement vertically' do
      @set_board.create_board
      @set_board.place_ship(1,1, "h")
      expect{ @set_board.place_ship(1,1, "v") }.to output("Can not place ship there\n").to_stdout
    end

    it 'warns if ship placement overlaps another ship placement horizontally' do
      @set_board.create_board
      @set_board.place_ship(1,1, "v")
      expect{ @set_board.place_ship(1,1, "h") }.to output("Can not place ship there\n").to_stdout
    end

    it 'returns no game_board if all ships are already placed' do
      @set_board.create_board
      @set_board.place_ship(1,1, "v")
      @set_board.place_ship(2,1, "v")
      expect{ @set_board.place_ship(3,1, "v") }.to output("All ships placed\n").to_stdout
    end
  end

end
