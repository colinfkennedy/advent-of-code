require_relative "point"

module DayThree
  class Grid

    DIR_DISTANCE_REGEXP = /([URLD])(\d+)/

    attr_reader :central_port, :cross_points, :grid_points

    def initialize(data)
      @central_port = Point.new(x: 0, y:0)
      @cross_points = []
      @grid_points = [central_port]

      wire_1 = get_wire_path(data[0])
      #puts "wire 1 #{wire_1}"
      wire_2 = get_wire_path(data[1])
      #puts "wire 2 #{wire_2}"

      @cross_points = wire_1 & wire_2

      #wire_1.each do |point_1|
      #  cross_points.push(point_1) if wire_2.include?(point_1)
      #end

      #puts "Cross points: #{cross_points}"

    end

    def closest_cross_distance
      cross_points.map { |point| manhattan_distance_to_central_port(point) }.min
    end

    private def manhattan_distance_to_central_port(point)
      x_and_y = point.split(',')
      x = x_and_y[0].to_i
      y = x_and_y[1].to_i
      (x - 0).abs + (y - 0).abs
    end

    private def get_wire_path(wire)
      puts "wire #{wire}"

      wire_instructions = wire.split(',')
      puts "Wire size #{wire_instructions.size}"

      wire_points = []
      x = 0
      y = 0
      wire_instructions.each_with_index do |direction_and_distance, index|
        #mark_wire_path(direction_and_distance: direction_and_distance, wire_points: wire_points)

        direction = direction_and_distance[0]
        steps = direction_and_distance[1..-1].to_i

        #puts "Direction: #{direction} Distance: #{steps}"
        #puts "Start point: #{x},#{y}"

        while steps > 0 do
          case direction
          when 'R'
            x += 1
          when 'L'
            x -= 1
          when 'U'
            y += 1
          when 'D'
            y -= 1
          end
          point = "#{x},#{y}"
          wire_points.push(point) unless wire_points.include?(point)
          steps -= 1
        end

        puts "Done #{index + 1} of #{wire_instructions.size}"
      end
      wire_points
    end

    private def mark_wire_path(direction_and_distance:, wire_points:)
      #split_dir_and_dist = direction_and_distance.match(DIR_DISTANCE_REGEXP)
      direction = direction_and_distance[0]
      distance = direction_and_distance[1..-1].to_i
      start_point = wire_points.last

      #puts "Direction: #{direction} Distance: #{distance}"
      #puts "Start point: #{start_point}"

      case direction
      when 'R'
        ((start_point.x + 1)..start_point.x + distance).each do |n|
          mark_point(x: n, y: start_point.y, wire_points: wire_points)
        end
      when 'L'
        ((start_point.x - 1).downto(start_point.x - distance)).each do |n|
          mark_point(x: n , y: start_point.y, wire_points: wire_points)
        end
      when 'U'
        ((start_point.y + 1)..start_point.y + distance).each do |n|
          mark_point(x: start_point.x, y: n, wire_points: wire_points)
        end
      when 'D'
        ((start_point.y - 1).downto(start_point.y - distance)).each do |n|
          mark_point(x: start_point.x, y: n, wire_points: wire_points)
        end
      end
    end

    private def mark_point(x:, y:, wire_points:)
      #puts "Marking #{x} #{y}"
      #point = Point.new(x: x, y: y)
      point = "x:#{x},y:#{y}"
      #if grid_points.include?(point)
      #  cross_points.push(point) unless cross_points.include?(point) || point == central_port || wire_points.include?(point)
      #else
      #  grid_points.push(point)
      #end
      wire_points.push(point) unless wire_points.include?(point)
    end
  end
end