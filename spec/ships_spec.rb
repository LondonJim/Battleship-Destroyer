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

  it 'can set x coordinate' do
    @ship.x_coordinate = 1
    expect(@ship.x_coordinate).to eq(1)
  end

  it 'can set y coordinate' do
    @ship.y_coordinate = 1
    expect(@ship.y_coordinate).to eq(1)
  end

  it 'can set direction' do
    @ship.direction = "v"
    expect(@ship.direction).to eq("v")
  end

end
