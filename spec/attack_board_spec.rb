require 'attack_board'

describe AttackBoard do

  @game_board = [[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                  [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                  [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                  [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                  [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                  [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                  [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                  [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                  [1, 1, nil, nil, nil, nil, nil, nil, nil, nil],
                  [0, 0, 0, nil, nil, nil, nil, nil, nil, nil]]

  before(:each) do
    @attack_board = AttackBoard.new(@game_board)
  end

  it 'creates a new instantiation of SetBoard class' do
    expect(@attack_board).to be_instance_of(AttackBoard)
  end

end
