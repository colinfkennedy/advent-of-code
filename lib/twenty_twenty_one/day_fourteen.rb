module TwentyTwentyOne
  class DayFourteen
    attr_reader :input, :polymer, :insert_map, :count_map

    def initialize(input)
      @input = input
      @polymer = input.shift
      @insert_map = {}
      @count_map = {}
      input.shift # discard empty line

      input.each do |line|
        key, value = line.split(' -> ')
        insert_map[key] = value
      end
    end

    def polymer_score(steps:)
      step(steps)
      # puts polymer
      # char_counts = polymer.chars.tally
      # puts char_counts
      puts count_map
      max = count_map.values.max
      min = count_map.values.min
      max - min
    end

    def step(steps)
      polymer.chars.each do |char|
        if count_map[char].nil?
          count_map[char] = 1
        else
          count_map[char] += 1
        end
      end

      steps.times do
        new_polymer = ''
        polymer.chars.each_with_index do |char, index|
          new_polymer << char
          test_key = "#{char}#{polymer[index + 1]}"
          next unless insert_map.key?(test_key)

          new_char = insert_map[test_key]
          if count_map[new_char].nil?
            count_map[new_char] = 1
          else
            count_map[new_char] += 1
          end
          new_polymer << new_char
        end
        @polymer = new_polymer
      end
    end
  end
end
