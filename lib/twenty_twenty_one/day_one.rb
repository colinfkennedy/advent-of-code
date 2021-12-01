module TwentyTwentyOne
  class DayOne
    attr_reader :input

    def initialize(input)
      @input = input
    end

    def depth_increases
      depth_increases = 0

      input.each_with_index do |line, index|
        next if index == 0

        depth_increases += 1 if line.to_i > input[index - 1].to_i
      end

      depth_increases
    end
  end
end
