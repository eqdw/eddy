module Eddy
  class Program
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
      ::Ncurses.initscr
      
      # Provide unbuffered input
      ::Ncurses.cbreak           
      
      # Turn off input echoing
      ::Ncurses.noecho           
      
      # Turn off newline translation
      ::Ncurses.nonl             
      
      # Turn off flush-on-interrupt
      ::Ncurses.stdscr.intrflush(false) 

      # Turn on keypad mode
      ::Ncurses.stdscr.keypad(true)           
    end
    private :init_ncurses
    
    def cleanup_ncurses
      ::Ncurses.echo
      ::Ncurses.nocbreak
      ::Ncurses.nl
      ::Ncurses.endwin      
    end
    private :cleanup_ncurses
  end
end