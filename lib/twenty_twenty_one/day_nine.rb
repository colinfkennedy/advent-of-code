module TwentyTwentyOne
  class DayNine
    attr_reader :input, :height_map

    def initialize(input)
      @input = input
      @height_map = input.map { |line| line.split('').map(&:to_i) }
      height_map.each_with_index do |row, y|
        row.each_with_index do |point_value, x|
          height_map[y][x] = Point.new(x, y, point_value, height_map)
        end
      end
    end

    def risk_levels_sum
      puts "Lowest points: #{lowest_points.map(&:value)}"
      puts "Lowest points size: #{lowest_points.size}"

      lowest_points.inject(0) { |sum, point| sum + point.value + 1 }
    end

    def largest_basins_product
      basin_sizes = []
      lowest_points.each do |point|
        basin_sizes << find_basin_size(point)
      end
      puts "basin sizes: #{basin_sizes}"
      basin_sizes.max(3).inject(:*)
    end

    private def find_basin_size(point, point_to_exclude = nil)
      return 0 if point.value == 9

      size = 1
      point.neighbours.each do |neighbour|
        next if neighbour == point_to_exclude

        size += find_basin_size(neighbour, point)
      end
      size
    end

    private def lowest_points
      height_map.flatten.select(&:lowest_point?)
    end

    class Point
      attr_accessor :visited
      attr_reader :x, :y, :value, :height_map

      def initialize(x, y, value, height_map)
        @x = x
        @y = y
        @value = value
        @height_map = height_map
        @visited = false
      end

      def neighbours
        neighbours = []
        neighbours << height_map[y - 1][x] if y.positive?
        neighbours << height_map[y + 1][x] if y < height_map.size - 1
        neighbours << height_map[y][x - 1] if x.positive?
        neighbours << height_map[y][x + 1] if x < height_map[y].size - 1
        neighbours
      end

      def lowest_point?
        neighbours.none? { |adjacent_point| adjacent_point.value <= value }
      end

      def ==(other)
        other.class == self.class && other.x == x && other.y == y
      end
    end
  end
end
