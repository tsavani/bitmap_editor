require_relative 'image'

class BitmapEditor

def run
  parse(get_user_input)
end

private

  def get_user_input
    print "> "
    gets.chomp
  end

  def parse(input)
    command, *args = input.split(' ').map{|arg| (arg == "0" || arg.to_i != 0) ? arg.to_i : arg}
    case command.upcase
    when 'I'
      initialise_new_image(*args)
    when 'C'
      clear_image
    when 'L'
      colour_pixel(*args)
    when 'V'
      vertical_strip(*args)
    when 'H'
      horizontal_strip(*args)
    when 'F'
      colour_area(*args)
    when 'S'
      @image.show
    when '?'
      show_help
    when 'X'
      exit_console
    else
        puts 'unrecognised command :('
    end
  end

  def initialise_new_image(*args)
    @image = Image.new(*args)
  end

  def clear_image
    begin
      @image.clear# unless @image.nil?
    rescue NoMethodError => e
      puts e.message
    end
  end

  def colour_pixel(*args)
    begin
      @image.set_pixel_colour(*args)
    rescue NoMethodError => e
      puts e.message
    rescue ArgumentError => a
      puts a.message
    end
  end

  def vertical_strip(*args)
    begin
      @image.colour_vertical_segment(*args)
    rescue NoMethodError => e
      puts e.message
    rescue ArgumentError => a
      puts a.message
    end
  end

  def horizontal_strip(*args)
    begin
      @image.colour_horizontal_segment(*args)
    rescue NoMethodError => e
      puts e.message
    rescue ArgumentError => a
      puts a.message
    end
  end

  def colour_area(*args)
    begin
      @image.fill(*args)
    rescue NoMethodError => e
      puts e.message
    rescue ArgumentError => a
      puts a.message
    end
  end

  def exit_console
    puts 'goodbye!'
    return exit 0
  end

  def show_help
      puts "? - Help
    I M N - Create a new M x N image with all pixels coloured white (O).
    C - Clears the table, setting all pixels to white (O).
    L X Y C - Colours the pixel (X,Y) with colour C.
    V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
    H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
    S - Show the contents of the current image
    X - Terminate the session"
  end
end
