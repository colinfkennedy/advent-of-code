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

    def life_support_rating
      oxegen_diagnostics = input.dup
      co2_diagnostics = input.dup

      oxegen_code = loop_through(oxegen_diagnostics, :get_new_input_oxegen)
      c02_code = loop_through(co2_diagnostics, :get_new_input_co2)

      puts "Oxegen code: #{oxegen_code}"
      puts "C02 code: #{c02_code}"
      oxegen_code.to_i(2) * c02_code.to_i(2)
    end

    def loop_through(diagnostics, method_to_call)
      index = 0
      while diagnostics.size > 1
        diagnostics = method(method_to_call).call(diagnostics, index)
        index += 1
      end
      diagnostics.first
    end

    def get_new_input_oxegen(diagnostics, index)
      if more_ones?(diagnostics, index)
        diagnostics.select { |line| line[index] == '1' }
      else
        diagnostics.select { |line| line[index] == '0' }
      end
    end

    def more_ones?(diagnostics, index)
      ones_count = 0
      diagnostics.each do |line|
        ones_count += line.strip[index].to_i
      end
      ones_count >= (diagnostics.size / 2.to_f).ceil
    end

    def get_new_input_co2(diagnostics, index)
      if less_ones?(diagnostics, index)
        diagnostics.select { |line| line[index] == '1' }
      else
        diagnostics.select { |line| line[index] == '0' }
      end
    end

    def less_ones?(diagnostics, index)
      ones_count = 0
      diagnostics.each do |line|
        ones_count += line.strip[index].to_i
      end
      ones_count < (diagnostics.size / 2.to_f).ceil
    end
  end
end
