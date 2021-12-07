module TwentyTwentyOne
  class DaySeven
    attr_reader :input

    def initialize(input)
      @input = input.map { |n| n.chomp.split(',').map { |m| m.to_i } }.first
    end

    def align_least_fuel
      target = median(input)
      puts "Target: #{target}"
      input.map { |n| (n - target).abs }.sum
    end

    def align_fuel_proper_engineering
      mean_target = mean(input)
      puts "Mean: #{mean_target}"
      target = input.find { |n| n == mean_target.floor or n == mean_target.round }
      puts "Target: #{target}"
      input.inject(0) do |sum, n|
        distance = (n - target).abs
        fuel_cost = (distance * (distance + 1)) / 2
        sum + fuel_cost
      end
    end

    def median(array)
      return nil if array.empty?

      sorted = array.sort
      len = sorted.length
      (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
    end

    def mean(array)
      return nil if array.empty?

      array.sum / array.length.to_f
    end
  end
end
