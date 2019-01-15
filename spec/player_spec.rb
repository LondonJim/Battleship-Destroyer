require 'player'

describe Player do

  before(:each) do
    @boards = []
    @player = Player.new(@boards)
  end

  describe("#boards") do
    it 'returns an object' do
      expect(@player.boards).to eq([])
    end

    it 'returns an object written to it' do
      @player.boards = ["test"]
      expect(@player.boards).to eq(["test"])
    end
  end

end
