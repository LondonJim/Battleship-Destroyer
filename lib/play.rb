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
    for i in 0..1
      puts"#{@players[i].name}, press enter when ready!"; STDIN.getc
      clear_screen
      puts "Your ships"
      @display.view_board(@players[i].boards.game_board)
      puts "\n\nYour attacks"
      @display.view_board(@players[i].boards.attack_board)
      STDIN.getc
    end

  end

  def game_over
  end

  def clear_screen
    if RUBY_PLATFORM =~ /win32|win64|\.NET|windows|cygwin|mingw32/i
      system('cls')
    else
      system('clear')
    end
  end

end
