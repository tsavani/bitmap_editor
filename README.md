# Bitmaps

Produce a ruby program that simulates a basic interactive bitmap editor.
Bitmaps are represented as an M x N matrix of pixels with each element
representing a colour.

### Input

bitmap has coordinates 1,1. Colours are specified by capital letters.

### Commands

There are eight supported commands:

1. I M N - Create a new M x N image.
2. C - Clears the table, setting all pixels to white (O).
3. L X Y C - Colours the pixel (X,Y) with colour C.
4. V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
5. H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
6. F X Y C - Fill the region R with the colour C. R is defined as: Pixel (X,Y) belongs to R.
7. S - Show the contents of the current image
8. X - Terminate the session

### Example

### Run from terminal

`ruby runner.rb`

In the example below, > represents input

    > I 5 6
    > L 2 3 A
    > S
    OOOOO
    OOOOO
    OAOOO
    OOOOO
    OOOOO
    OOOOO
    > V 2 3 6 W
    > H 3 5 2 Z
    > S
    OOOOO
    OOZZZ
    OWOOO
    OWOOO
    OWOOO
    OWOOO

## Run the tests

First install `rspec`:

    $ gem install rspec

And then:

    $ Rake
