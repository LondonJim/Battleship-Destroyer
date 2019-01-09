require 'ships'

describe Ship do

  before(:each) do
    @ship = Ship.new(3)
  end

  it 'creates a new instantiation of SetBoard class' do
    expect(@ship).to be_instance_of(Ship)
  end

  it 'instantiates with an empty @game_board array' do
    expect(@ship.size).to eq(3)
  end

end
