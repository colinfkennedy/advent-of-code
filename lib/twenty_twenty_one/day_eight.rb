module TwentyTwentyOne
  class DayEight
    attr_reader :output_values

    def initialize(input)
      @output_values = input.map { |line| line.split('|')[1].split(' ') }
    end

    def unique_segment_digits
      output_values.inject(0) do |number_of_values, values|
        unique_segment_values = values.select do |value|
          value.size == 2 or value.size == 3 or value.size == 4 or value.size == 7
        end
        number_of_values + unique_segment_values.length
      end
    end
  end
end
