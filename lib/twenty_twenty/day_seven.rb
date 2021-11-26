module TwentyTwenty
  class DaySeven
    MY_BAG = 'shiny gold'.freeze
    INNER_BAG_REGEX = /(\d+) (\w+\s?\w*) bags?/

    def self.count_container_bags(input)
      outer_bags = []
      container_bags = {}
      contained_by_map = {}
      input.each do |line|
        line = line.strip
        outer_bag, inner_bags = line.split('contain')
        outer_bag.slice!(/\sbags/)
        outer_bag = outer_bag.strip
        outer_bags.push(outer_bag)

        inner_bags = inner_bags.split(',').map do |inner_bag|
          matched = inner_bag.strip.match(INNER_BAG_REGEX)
          matched[2] unless matched.nil?
        end

        inner_bags.each do |inner_bag|
          contained_by_map[inner_bag] = [] if contained_by_map[inner_bag].nil?
          contained_by_map[inner_bag].push(outer_bag)
        end

        container_bags[outer_bag] = inner_bags.compact
      end
      puts outer_bags.uniq
      puts container_bags
      puts contained_by_map

      gold_containers = find_containing_bags(MY_BAG, contained_by_map)

      puts gold_containers
      gold_containers.size
    end

    def self.number_bags_needed(input)
      outer_bags = []
      container_bags = {}
      contains_map = {}
      number_contained_map = {}
      input.each do |line|
        line = line.strip
        outer_bag, inner_bags = line.split('contain')
        outer_bag.slice!(/\sbags/)
        outer_bag = outer_bag.strip

        number_contained_map[outer_bag] = 0

        inner_bags = inner_bags.split(',').map do |inner_bag|
          matched = inner_bag.strip.match(INNER_BAG_REGEX)
          if matched.nil?
            {
              quantity: 0
            }
          else
            {
              bag_name: matched[2],
              quantity: matched[1].to_i
            }
          end
        end

        inner_bags.each do |inner_bag|
          contains_map[outer_bag] = [] if contains_map[outer_bag].nil?
          contains_map[outer_bag].push(inner_bag)
        end

        container_bags[outer_bag] = inner_bags.compact
      end

      find_containing_bags_count(MY_BAG, contains_map)
    end

    def self.find_containing_bags(bag, contained_by_map)
      all_containing_bags = []
      containing_bags = contained_by_map[bag]
      return [] if containing_bags.nil?

      containing_bags.each do |containing_bag|
        next if containing_bag.nil?

        all_containing_bags.push(find_containing_bags(containing_bag, contained_by_map))
      end
      all_containing_bags.push(containing_bags) unless containing_bags.first.nil?
      all_containing_bags.flatten.uniq
    end

    def self.find_containing_bags_count(bag, contains_map)
      return 1 if bag.nil?

      containing_bags_count = 0
      containing_bags = contains_map[bag]

      containing_bags.each do |containing_bag|
        containing_bags_count += (find_containing_bags_count(containing_bag[:bag_name],
                                                             contains_map) * containing_bag[:quantity]) + containing_bag[:quantity]
      end
      containing_bags_count
    end
  end
end
