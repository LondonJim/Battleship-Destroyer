require 'ship'

describe Ship do

  before(:each) do
    @ship = Ship.new(3)
  end

  it 'instantiates with a ship size' do
    expect(@ship.size).to eq(3)
  end

end
