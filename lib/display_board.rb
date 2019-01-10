class DisplayBoard

  def view_board(board)
    # board = board.reverse
    total_rows = board.length
      board.each { |row|
        print "  "
        (board[0].length).times {print "----"}
        print "-\n"
        total_rows >= 10 ? (print total_rows) : (print total_rows.to_s + " ")
        print "|"
        row.each { |el|
          el == nil ? (print "   ") : (print " " + el + " ")
          print "|"
        }
        print "\n"
        total_rows -= 1
      }
      print "  "
      (board[0].length).times { print "----"}
      print "-\n    "
      board[0].each_with_index { |el, index|
        print index + 1
        index >= 9 ? (print "  ") : (print "   ")
      }
  end

end
