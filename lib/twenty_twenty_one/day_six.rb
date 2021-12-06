module TwentyTwentyOne
  class DaySix
    attr_reader :fishies

    def initialize(input)
      @fishies = input.first.split(',').map(&:to_i)
    end

    def fish_count(day:)
      (1..day).each do |_|
        new_fish_count = 0
        fishies.each_with_index do |fish, index|
          if fish.zero?
            fishies[index] = 6
            new_fish_count += 1
          else
            fishies[index] = fish - 1
          end
        end
        new_fish_count.times { fishies << 8 }
        new_fish_count = 0
      end
      fishies.size
    end
  end
end
