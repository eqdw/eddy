module Eddy
  class Program    
    # Overridable Ncurses reference
    def self.N
      ::Ncurses
    end

    def initialize
      @main_menu = nil
    end

    def main_menu(options)
      @main_menu = Eddy::Menu.new(options)
    end

    def launch
      begin
        init_ncurses
        @main_menu.render
      ensure
        cleanup_ncurses
      end
    end

    def init_ncurses      
      n.initscr

      # Provide unbuffered input
      n.cbreak

      # Turn off input echoing
      n.noecho

      # Turn off newline translation
      n.nonl

      # Turn off flush-on-interrupt
      n.stdscr.intrflush(false)

      # Turn on keypad mode
      n.stdscr.keypad(true)           

      # Turn on colors
      n.start_color()

      set_color
    end
    private :init_ncurses

    def set_color
      n.init_pair(1, Ncurses::COLOR_WHITE, Ncurses::COLOR_BLUE)
      n.stdscr.bkgd(n.COLOR_PAIR(1))
    end
    private :set_color
    
    def cleanup_ncurses
      n.echo
      n.nocbreak
      n.nl
      n.endwin
    end
    private :cleanup_ncurses

    def n
      Program.N
    end
    private :n
  end
end
