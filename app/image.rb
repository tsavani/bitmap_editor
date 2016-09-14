class Image
  attr_reader :cols, :rows, :pixels

  def initialize(cols, rows)
    @cols, @rows = cols, rows
    clear
  end

  def clear
    @pixels = (1..@rows).map{ (1..@cols).map{"O"} } #zero based array of arrays (@pixels[row || y][col || x])
  end

  def get_pixel_colour(x, y)
    # subtract one from each pixel co-ordinates
    # upper-left pixel has co-ordinates 1,1
    # @pixels[pixel[0] - 1][pixel[1] -1 ]
    @pixels[y - 1][x - 1]
  end

  def set_pixel_colour(x, y, colour)
    @pixels[y - 1][x - 1] = colour
  end

  def to_s
    @pixels.map{|row| row.join(' ') }.join("\n") + "\n"
  end

  def show
    print self
  end

  def colour_vertical_segment(col, from_row, to_row, colour)
    (from_row..to_row).each{|row| set_pixel_colour(col, row, colour)}
  end

  def colour_horizontal_segment(from_col, to_col, row, colour)
    (from_col..to_col).each{|col| set_pixel_colour(col, row, colour)}
  end

  def fill(x, y, colour)
    current_pixel_colour = get_pixel_colour(x, y)
    flood_fill(x, y, current_pixel_colour, colour)
    @pixels
  end

  def get_neighbours(col, row)
    rows = (row - 1 .. row + 1).select{|r| (1..@rows).include?(row)}
    cols = (col - 1 .. col + 1).select{|c| (1..@cols).include?(col)}
    neighbours = []
    neighbours = rows.map{|r| cols.map {|c| [col,row]} }.flatten(1) - [[col,row]]
    puts "\nmy neighbours(#{col},#{row}): #{neighbours}"
    return neighbours
  end

  def flood_fill(x, y, target_colour, replacement_colour)
    #  1. If target-color is equal to replacement-color, return.
    return if target_colour == replacement_colour
    #  2. If the color of node is not equal to target-color, return.
    return if get_pixel_colour(x, y) != target_colour
    #  3. Set the color of node to replacement-color.
    set_pixel_colour(x, y, replacement_colour)
    #  4. Perform Flood-fill (one step to the west of node, target-color, replacement-color).
    flood_fill(x - 1, y, target_colour, replacement_colour) if (1..@rows).cover?(x)
    #     Perform Flood-fill (one step to the east of node, target-color, replacement-color).
    flood_fill(x + 1, y, target_colour, replacement_colour) if (1..@rows).cover?(x)
    #     Perform Flood-fill (one step to the north of node, target-color, replacement-color).
    flood_fill(x, y - 1, target_colour, replacement_colour) if (1..@cols).cover?(y)
    #     Perform Flood-fill (one step to the south of node, target-color, replacement-color).
    flood_fill(x, y + 1, target_colour, replacement_colour) if (1..@cols).cover?(y)
  end
end
