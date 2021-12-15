require 'pqueue'

module TwentyTwentyOne
  class DayFifteen
    attr_reader :input, :cave_map, :infinity

    def initialize(input, large_path: false)
      @infinity = 9_999_999
      @input = input.dup
      @cave_map = generate_cave_map(@input, large_path)
      cave_map.each_with_index do |line, y|
        line.each_with_index do |risk, x|
          end_point = x == line.size - 1 && y == cave_map.size - 1
          cave_map[y][x] = Point.new(x: x, y: y, risk: risk, cave_map: cave_map, end_point: end_point)
        end
      end
    end

    def generate_cave_map(input, large_path)
      cave_map = input.map { |line| line.chars.map(&:to_i) }
      if large_path
        5.times.flat_map do |ny|
          cave_map.map do |row|
            5.times.flat_map do |nx|
              row.map do |risk|
                new_risk = risk + ny + nx
                new_risk -= 9 while new_risk > 9
                new_risk
              end
            end
          end
        end
      else
        cave_map
      end
    end

    def lowest_risk_path_cost
      start_point = cave_map[0][0]
      start_point.risk = 0
      priority_queue = PQueue.new { |a, b| a.risk <=> b.risk }
      priority_queue.push(start_point)
      risks = {}
      until priority_queue.empty?
        priority_point = priority_queue.shift

        return priority_point.risk if priority_point.end_point?

        priority_point.neighbours.each do |neighbour|
          combined_risk = priority_point.risk + neighbour.risk
          min_for_neighbour = risks.fetch(neighbour, infinity)
          next unless combined_risk < min_for_neighbour

          risks[neighbour] = combined_risk
          neighbour.risk = combined_risk
          priority_queue.push(neighbour)
        end
      end
      infinity # no path found
    end
  end

  class Point
    attr_accessor :risk
    attr_reader :x, :y, :cave_map

    def initialize(x:, y:, risk:, cave_map:, end_point: false)
      @x = x
      @y = y
      @risk = risk
      @cave_map = cave_map
      @end_point = end_point
    end

    def neighbours
      neighbours = []
      neighbours << cave_map[y - 1][x] if y.positive? # up
      neighbours << cave_map[y + 1][x] if y < cave_map.size - 1 # down
      neighbours << cave_map[y][x - 1] if x.positive? # left
      neighbours << cave_map[y][x + 1] if x < cave_map[y].size - 1 # right
      neighbours
    end

    def end_point?
      @end_point
    end

    def ==(other)
      other.class == self.class && other.x == x && other.y == y
    end

    def to_s
      "#{x},#{y} risk: #{risk}"
    end
  end
end
