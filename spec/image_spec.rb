require_relative '../app/image'

describe 'Image' do

  before do
    @cols = 5
    @rows = 6
    @bitmap = Image.new(@cols, @rows)
  end

  it "has 'M (cols)' x 'N (rows)' pixels" do
    expect(@bitmap.cols).to eql(5)
    expect(@bitmap.rows).to eql(6)
  end

  it "has initial colour of 'O'" do
    (1..@rows).map do |row|
      (1..@cols).map do |col|
        # puts "col => #{col}, row => #{row} [get_pixel_colour(#{col}, #{row})]"
        colour = @bitmap.get_pixel_colour(col,row) # x,y
        expect("O").to eq(colour)
      end
    end
  end

  it "can set a pixels colour" do
    colour = "C"
    @bitmap.set_pixel_colour(2,3, colour)
    expect(@bitmap.get_pixel_colour(2,3)).to eq("C")
  end

  it "returns a pixels colour" do
    expect(@bitmap.get_pixel_colour(3,4)).to eq("O")
  end

  it "prints itself as a string" do
    bitmap = "O O O O O\nO O O O O\nO O O O O\nO O O O O\nO O O O O\nO O O O O\n"
    expect(@bitmap.to_s).to eq(bitmap)
  end

  it "draws a vertical segment of colour 'A' in column X between rows Y1 & Y2 (inclusive)" do
    bitmap = "O O O O O\nO O O O O\nO W O O O\nO W O O O\nO O O O O\nO O O O O\n"
    @bitmap.colour_vertical_segment(2,3,4,"W")

    expect(@bitmap.to_s).to eq bitmap
  end

  it "draws a horizontal segment of colour 'Z' in row Y between columns X1 & X2 (inclusive)" do
    bitmap = "O O O O O\nO O Z Z O\nO O O O O\nO O O O O\nO O O O O\nO O O O O\n"
    @bitmap.colour_horizontal_segment(3,4,2,"Z")

    expect(@bitmap.to_s).to eq bitmap
  end

  it "fills region 'R' with colour 'C'" do
    bitmap = "J J J J J\nJ J J J J\nJ A J J J\nJ J J J J\nJ J J J J\nJ J J J J\n"
    @bitmap.set_pixel_colour(2,3,"A")
    @bitmap.fill(3,3,"J")
    expect(@bitmap.to_s).to eq bitmap

    bitmap = "J J J J J\nJ J Z Z J\nJ W J J J\nJ W J J J\nJ J J J J\nJ J J J J\n"
    @bitmap.set_pixel_colour(2,3,"A")
    @bitmap.colour_vertical_segment(2,3,4,"W")
    @bitmap.colour_horizontal_segment(3,4,2,"Z")
    @bitmap.fill(3,3,"J")
    expect(@bitmap.to_s).to eq bitmap
  end

  it "clears image to be all 'O''s" do
    @bitmap.set_pixel_colour(2,3,"A")
    @bitmap.colour_vertical_segment(2,3,4,"W")
    @bitmap.colour_horizontal_segment(3,4,2,"Z")
    @bitmap.fill(3,3,"J")
    @bitmap.clear

    (1..@rows).map do |row|
      (1..@cols).map do |col|
        colour = @bitmap.get_pixel_colour(col,row) # x,y
        expect("O").to eq(colour)
      end
    end
  end
end
