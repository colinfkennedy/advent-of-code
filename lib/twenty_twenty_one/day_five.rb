module TwentyTwentyOne
  class DayFive
    COORDINATE_REGEX = /(\d+),(\d+) -> (\d+),(\d+)/

    attr_reader :input, :coordinates, :grid

    def initialize(input, with_diagonals: false)
      @input = input
      @coordinates = []
      input.each do |line|
        match = line.match(COORDINATE_REGEX)
        x1 = match[1].to_i
        y1 = match[2].to_i
        x2 = match[3].to_i
        y2 = match[4].to_i

        @coordinates << [x1, y1, x2, y2]
      end

      max_x = coordinates.map { |x1, _y1, x2, _y2| [x1, x2] }.flatten.max
      max_y = coordinates.map { |_x1, y1, _x2, y2| [y1, y2] }.flatten.max

      @grid = Array.new(max_y + 1) { Array.new(max_x + 1) { 0 } }
      coordinates.each do |x1, y1, x2, y2|
        if x1 == x2 || y1 == y2
          new_x1 = [x1, x2].min
          new_x2 = [x1, x2].max
          new_y1 = [y1, y2].min
          new_y2 = [y1, y2].max
          (new_x1..new_x2).each do |x|
            (new_y1..new_y2).each do |y|
              grid[y][x] += 1
            end
          end
        else
          next unless with_diagonals

          x_coords = x1 < x2 ? (x1..x2).to_a : x1.downto(x2).to_a
          y_coords = y1 < y2 ? (y1..y2).to_a : y1.downto(y2).to_a

          x_coords.zip(y_coords) do |x, y|
            # puts "Diagonal - x: #{x}, y: #{y}"
            grid[y][x] += 1
          end
        end
      end
    end

    def overlapping_points_count
      # puts "Grid: #{grid.size} x #{grid[0].size}"
      # puts grid.to_s
      grid.flatten.count { |point| point > 1 }
    end
  end
end
