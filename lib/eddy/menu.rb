module Eddy
  class Menu
    def initialize(options = {})
      @title = options[:title]
      @items = options[:items]
    end

    def render
      @scr = ::Ncurses.stdscr
      @scr.clear()
      @scr.border(*([0]*8)) # calls WINDOW#border(0, 0, 0, 0, 0, 0, 0, 0)

      print_centered_title


      @scr.move(3,3)
      @scr.addstr("Press a key to continue")
      @scr.getch()

      # TODO Tim Display border with appropriate options displayed
    end

    def print_centered_title
      title_offset = @title.length / 2
      midpoint     = ::Ncurses.COLS / 2

      @scr.move(0, midpoint - title_offset)
      @scr.addstr(@title)

    end
  end
end
