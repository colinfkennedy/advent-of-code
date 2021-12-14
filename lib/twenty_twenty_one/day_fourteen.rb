module TwentyTwentyOne
  class DayFourteen
    attr_reader :input, :polymer, :insert_map, :count_map, :pairs_count_map

    def initialize(input)
      @input = input.dup
      @polymer = @input.shift
      @insert_map = {}
      @pairs_count_map = {}
      @count_map = {}
      @input.shift # discard empty line

      polymer.chars.each_cons(2) do |char_pair|
        key = char_pair.join
        if pairs_count_map[key].nil?
          pairs_count_map[key] = 1
        else
          pairs_count_map[key] += 1
        end
      end

      polymer.chars.each do |char|
        if count_map[char].nil?
          count_map[char] = 1
        else
          count_map[char] += 1
        end
      end

      input.each do |line|
        key, value = line.split(' -> ')
        insert_map[key] = value
      end
      puts "Initial pairs count map: #{pairs_count_map}"
      puts "Initial count map: #{count_map}"
    end

    def polymer_score(steps:)
      step(steps)
      puts "Final count map: #{count_map}"
      max = count_map.values.max
      min = count_map.values.min
      max - min
    end

    def step(steps)
      steps.times do
        new_pairs_count_map = pairs_count_map.dup
        pairs_count_map.each do |pair, count|
          insert_key = insert_map[pair]
          insert_count(count_map, insert_key, count)

          new_pairs_count_map[pair] -= count

          insert_count(new_pairs_count_map, pair[0] + insert_key, count)

          insert_count(new_pairs_count_map, insert_key + pair[1], count)
        end
        @pairs_count_map = new_pairs_count_map
      end
    end

    def insert_count(map, key, value)
      if map[key].nil?
        map[key] = value
      else
        map[key] += value
      end
    end
  end
end
