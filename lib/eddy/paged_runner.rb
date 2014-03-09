require 'popen4'

# Class that wraps invocations of popen4 to page the output
class PagedRunner
  
  # takes a command to run, and optional flags to modify it
  # @param cmd [String] the command to run
  # @param opts [Hash] optional flags
  #
  # allowed options:
  # :window_size [Numeric] defaults to 40, how many lines to paginate by
  # :args [Array] list of string arguments to pass to the command
  def initialize(cmd, opts={})

    opts = {:window_size => 40, :args => []}.merge(opts)

    @command     = "#{cmd} #{opts[:args].join(" ")}"
    @window_size = opts[:window_size]

    @output       = []
    @current_line = 0
  end

  # runs the @command using POpen
  # buffers the output in @output to be paginated
  # by #next
  def run
    POpen4::popen4(@command) do |stdout, stderr, stdin, pid|
      while(line = stdout.gets) #returns nil, ends loop when done
        @output << line
      end
    end
  end

  def has_next_page?
    @current_line < @output.length
  end

  def next_page
    if has_next_page?
      rtn = @output[@current_line, @window_size]
      @current_line += @window_size

      # say there is 1/2 a page worth of lines left
      # we read @window_size lines, but only get 1/2 
      # that many left. If we add @window_size to the 
      # current_line counter, it'll be too high. However,
      # since we know we've read allt he output, reset
      # the current_line offset to the end of the output
      if @current_line > @output.length
        @current_line  = @output.length
      end
      rtn
    else
      nil
    end
  end
end
