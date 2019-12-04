module DayThree
  class Point
    attr_reader :x, :y

    def initialize(x:, y:)
      @x = x
      @y = y
    end

    def ==(o)
      o.class == self.class && o.x == x && o.y == y
    end

    def to_s
      "Point - x:#{x} y:#{y}"
    end

    def manhattan_distance_to_central_port
      (self.x - 0).abs + (self.y - 0).abs
    end
  end
end