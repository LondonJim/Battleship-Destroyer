require_relative "set_board"

class Player

  attr_accessor :boards, :name

  def initialize(boards = SetBoard.new, name ="Player")
    @boards = boards
    @name = name
  end

end
