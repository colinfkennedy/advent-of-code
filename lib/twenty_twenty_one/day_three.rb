module TwentyTwentyOne
  class DayThree
    attr_reader :input

    def initialize(input)
      @input = input
    end

    def power_consumption
      ones_count = []

      input.each do |line|
        line.strip.chars.each_with_index do |bit, index|
          if ones_count[index].nil?
            ones_count[index] = bit == '1' ? 1 : 0
          elsif bit == '1'
            ones_count[index] += 1
          end
        end
      end

      gamma_rate_binary = ''
      epsilon_rate_binary = ''

      ones_count.each do |count|
        gamma_rate_binary += count > (input.size / 2) ? '1' : '0'
        epsilon_rate_binary += count > (input.size / 2) ? '0' : '1'
      end
      
      gamma_rate_binary.to_i(2) * epsilon_rate_binary.to_i(2)
    end
  end
end
