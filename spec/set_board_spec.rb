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
      expect(@set_board.create_board).to eq([[" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
                                             [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
                                             [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
                                             [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
                                             [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
                                             [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
                                             [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
                                             [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
                                             [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
                                             [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
                                             [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
                                             [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "]])
    end

  end

end
