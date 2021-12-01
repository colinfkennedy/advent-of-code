module TwentyTwentyOne
  class DayOne
    attr_reader :input

    def initialize(input)
      @input = input
    end

    def depth_increases
      depth_increases = 0

      input.each_with_index do |line, index|
        next if index.zero?

        depth_increases += 1 if line.to_i > input[index - 1].to_i
      end

      depth_increases
    end

    def window_depth_increases
      depth_increases = 0
      previous_group_sum = input[0..2].sum
      start_index = 1
      end_index = 3

      while end_index <= input.length
        group_sum = input[start_index..end_index].sum
        depth_increases += 1 if group_sum > previous_group_sum
        previous_group_sum = group_sum
        start_index += 1
        end_index += 1
      end

      depth_increases
    end
  end
end
