module TwentyTwenty
  class DaySeven
    MY_BAG = "shiny gold"
    INNER_BAG_REGEX = /\d (\w+\s?\w*) bags?/

    def self.count_bags(input)
      outer_bags = []
      container_bags = {}
      contained_by_map = {}
      input.each do |line|
        line = line.strip
        outer_bag, inner_bags = line.split("contain")
        outer_bag.slice!(/\sbags/)
        outer_bag = outer_bag.strip
        outer_bags.push(outer_bag)

        inner_bags = inner_bags.split(",").map do |inner_bag|
          matched = inner_bag.strip.match(INNER_BAG_REGEX)
          matched[1] unless matched.nil?
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
      # second_level_containers = []
      # gold_containers.each do |gold_container|
      #   next if contained_by_map[gold_container].nil?
      #
      #   second_level_containers.push(contained_by_map[gold_container])
      # end
      # second_level_containers = second_level_containers.flatten.uniq
      # puts "Second level: #{second_level_containers}"
      # bag_options = []
      #
      # (gold_containers + second_level_containers).each do |option|
      #   bag_options.push(option) if outer_bags.include?(option)
      # end
      #
      # # outer_bags.each do |bag|
      # #   bag_options.each do |bag_option|
      # #     bag_options.push(bag) if container_bags[bag].include?(bag_option)
      # #   end
      # # end
      #
      # puts bag_options
      # bag_options.uniq.size
      puts gold_containers
      gold_containers.size
    end

    def self.find_containing_bags(bag, contained_by_map)
      all_containing_bags = []
      containing_bags = contained_by_map[bag]
      return [] if containing_bags.nil?

      containing_bags.each do |containing_bag|
        all_containing_bags.push(find_containing_bags(containing_bag, contained_by_map))
      end
      all_containing_bags.push(containing_bags).flatten.uniq
    end
  end
end
