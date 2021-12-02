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
        matched_instruction = instruction.match(INSTRUCTION_REGEX)
        direction = matched_instruction[1]
        distance = matched_instruction[2].to_i

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
  end
end
