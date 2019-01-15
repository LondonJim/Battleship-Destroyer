require_relative "ship"

class SetBoard

  attr_reader :game_board, :placement_active
  attr_accessor :attack_board

  def initialize(width = 10, height = 10, ships = [Ship.new(3), Ship.new(2)])
    @width = width
    @height = height
    @game_board = []
    @attack_board = []
    @ships = ships
    @ship_number = 0
    @placement_active = true
    create_boards
  end

  def place_ship(x, y, direction)
    # x and y are kept true to normal coordinates on a graph, 2D array is reversed
    @game_board = @game_board.reverse
    ship_length = @ships[@ship_number].size

    (boundary_check(x, y, direction, ship_length) &&
      overlap_check(x, y, direction, ship_length)) ? nil : (puts "Can not place ship there";
        @game_board = @game_board.reverse; return "error")

    if direction == "h"
      for n in 0...ship_length
        @game_board[y - 1][x - 1 + n] = @ship_number
      end
    elsif direction == "v"
      for n in 0...ship_length
        @game_board[y - 1 + n][x - 1] = @ship_number
      end
    end
    @ship_number += 1
    @game_board = @game_board.reverse
    finish_placement? ? (@placement_active = false; return @game_board) : nil
    @game_board
  end

  private

  def create_boards()
    @game_board = Array.new(@width) { Array.new(@height) }
    @attack_board = Array.new(@width) { Array.new(@height) }
  end

  def boundary_check(x, y, direction, ship_length)
    if direction == "h"
      return (x + ship_length - 1) <= @width
    elsif direction == "v"
      return (y + ship_length - 1) <= @height
    else
      false
    end
  end

  def overlap_check(x, y, direction, ship_length)
    if direction == "h"
      for n in 0...ship_length
        return @game_board[y - 1][x - 1 + n] == nil
      end
    elsif direction == "v"
      for n in 0...ship_length
        return @game_board[y - 1 + n][x - 1] == nil
      end
    else
      false
    end
  end

  def finish_placement?
    @ships.length <= @ship_number ? (return true) : (return false)
  end

end
