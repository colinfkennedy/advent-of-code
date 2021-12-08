require_relative 'digit_segment_decoder'

module TwentyTwentyOne
  class DayEight
    attr_reader :input, :output_values

    def initialize(input)
      @input = input
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

    def sum_output_values
      input.inject(0) do |sum, line|
        decoded_output_digits = TwentyTwentyOne::DigitSegmentDecoder.new(line).decode_output_digits
        puts "Decoded output digits: #{decoded_output_digits}"
        sum + TwentyTwentyOne::DigitSegmentDecoder.new(line).decode_output_digits
      end
    end
  end
end
