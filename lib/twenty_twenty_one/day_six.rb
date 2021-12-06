module TwentyTwentyOne
  class DaySix
    attr_reader :fishies

    def initialize(input)
      @fishies = input.first.split(',').map(&:to_i)
    end

    def fish_count(day:)
      fish_days_left_count = (0..8).map { |days_left| fishies.count(days_left) }

      (1..day).each do |_|
        fish_who_spawned = fish_days_left_count[0]

        fish_days_left_count.rotate!

        fish_days_left_count[6] += fish_who_spawned
      end

      fish_days_left_count.sum
    end
  end
end
