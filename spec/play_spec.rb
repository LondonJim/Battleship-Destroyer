require 'play'

describe Play do

  before(:each) do
    @play = Play.new
  end

  it 'creates a new instantiation of Play class' do
    expect(@play).to be_instance_of(Play)
  end
  
end
