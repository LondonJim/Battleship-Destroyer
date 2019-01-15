require_relative 'display_board'
require_relative 'player'

class Play

  def initialize(players = [Player.new, Player.new], display = DisplayBoard.new)
    @players = players
    @display = display
    @winner = nil
  end

  def start
    name_entry
    placement
    attack_game
    game_over
  end

  private

  def name_entry
    clear_screen
    puts "Battleships"
    for i in 0..1
      puts "Player #{i + 1}, enter name:"
      @players[i].name = gets.chomp
    end
  end

  def placement
    clear_screen
    for i in 0..1
      while @players[i].boards.placement_active
        @display.view_board(@players[i].boards.game_board)
        puts "\nPlace your ships #{@players[i].name}"
        puts "x coordinate:"
        x = gets.to_i
        puts "y coordinate:"
        y = gets.to_i
        puts "vertical or horizontal on grid?(v/h):"
        direction = gets.chomp
        (@players[i].boards.place_ship(x, y, direction)) == "error" ?
          (puts"Press Enter to continue"; STDIN.getc) : nil
        clear_screen
      end
      @display.view_board(@players[i].boards.game_board)
      puts"\nAll ships placed\nPress Enter to continue"
      STDIN.getc
      clear_screen
    end
  end

  def attack_game
    player = 1
    while @winner == nil
      clear_screen
      player = other_player(player)
      puts"#{@players[player].name}, press enter when ready!"; STDIN.getc
      clear_screen
      puts"#{@players[player].name}'s turn"
      puts "Your ships"
      @display.view_board(@players[player].boards.game_board)
      puts "\n\nYour attacks"
      @display.view_board(@players[player].boards.attack_board)
      puts "\nAttacking..."
      puts "x coordinate:"
      x = gets.to_i
      puts "y coordinate:"
      y = gets.to_i
      attack(x, y, player)
      puts "Press Enter"
      STDIN.getc
    end
    game_over
  end

  def attack(x, y, i)
    if (x <= 10 && x >= 1) && (y <= 10 && y >= 1)
      attack_check?(x, y, i) ? hit_action(i) : miss_action(i)
    else
      puts "Invalid coordinate, it's a miss!"; return
    end
  end

  def attack_check?(x, y, i)
    x -= 1; y -= 1
    player_game_board = @players[other_player(i)].boards.game_board.reverse
    player_attack_board = @players[i].boards.attack_board.reverse

    if player_game_board[y][x] != (nil && "X")
      player_attack_board[y][x] = "X"
      player_game_board[y][x] = "X"
      @players[other_player(i)].boards.game_board = player_game_board.reverse
      @players[i].boards.attack_board = player_attack_board.reverse
      return true
    else
      player_attack_board[y][x] = "X"
      player_game_board[y][x] = "X"
      @players[other_player(i)].boards.game_board = player_game_board.reverse
      @players[i].boards.attack_board = player_attack_board.reverse
      return false
    end
  end

  def hit_action(i)
    puts "Hit!"
    ships_left = @players[i].boards.ships.length
    for n in 0...@players[i].boards.ships.length
      ship_parts_left = false
      @players[other_player(i)].boards.game_board.each do |row|
        row.include?(n) ? ship_parts_left = true : nil
      end
      ship_parts_left == true ? nil : (ships_left -= 1)
    end
    ships_left == 0 ? (@winner = @players[i].name) : nil
    puts "Ships remaining: #{ships_left}"
  end

  def miss_action(i)
    puts "Miss!"
  end

  def game_over
    puts "#{@winner} is the winner!"
  end

  def other_player(i)
    i == 0 ? (return 1) : (return 0)
  end

  def clear_screen
    if RUBY_PLATFORM =~ /win32|win64|\.NET|windows|cygwin|mingw32/i
      system('cls')
    else
      system('clear')
    end
  end

end

# play = Play.new
# play.start
