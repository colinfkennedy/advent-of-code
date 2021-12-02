module TwentyTwentyOne
  class DayTwo
    INSTRUCTION_REGEX = /([a-z]+)\s(\d)/

    attr_reader :input

    def initialize(input)
      @input = input
    end

    def product_of_depth_and_position
      depth = 0
      horizontal_position = 0

      input.each do |instruction|
        direction, distance = get_direction_and_distance(instruction)

        case direction
        when 'forward'
          horizontal_position += distance
        when 'down'
          depth += distance
        when 'up'
          depth -= distance
        end
      end

      depth * horizontal_position
    end

    def product_of_depth_and_position_with_aim
      depth = 0
      horizontal_position = 0
      aim = 0

      input.each do |instruction|
        direction, distance = get_direction_and_distance(instruction)

        case direction
        when 'forward'
          horizontal_position += distance
          depth += aim * distance
        when 'down'
          aim += distance
        when 'up'
          aim -= distance
        end
      end

      depth * horizontal_position
    end

    private def get_direction_and_distance(instruction)
      match = instruction.match(INSTRUCTION_REGEX)
      direction = match[1]
      distance = match[2].to_i

      [direction, distance]
    end
  end
end
