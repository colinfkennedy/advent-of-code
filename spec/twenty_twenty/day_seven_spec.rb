require 'twenty_twenty/day_seven'

describe TwentyTwenty::DaySeven do
  context 'with test input' do
    it 'gets the answer 4 for bag colours' do
      input = ['light red bags contain 1 bright white bag, 2 muted yellow bags.',
               'dark orange bags contain 3 bright white bags, 4 muted yellow bags.',
               'bright white bags contain 1 shiny gold bag.',
               'muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.',
               'shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.',
               'dark olive bags contain 3 faded blue bags, 4 dotted black bags.',
               'vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.',
               'faded blue bags contain no other bags.',
               'dotted black bags contain no other bags.']
      expect(described_class.count_container_bags(input)).to eq(4)
    end

    it 'gets the answer 32 for number of bags' do
      input = ['light red bags contain 1 bright white bag, 2 muted yellow bags.',
               'dark orange bags contain 3 bright white bags, 4 muted yellow bags.',
               'bright white bags contain 1 shiny gold bag.',
               'muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.',
               'shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.',
               'dark olive bags contain 3 faded blue bags, 4 dotted black bags.',
               'vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.',
               'faded blue bags contain no other bags.',
               'dotted black bags contain no other bags.']
      expect(described_class.number_bags_needed(input)).to eq(32)
    end

    it 'gets the answer 126 for number of bags for different input' do
      input = ['shiny gold bags contain 2 dark red bags.',
               'dark red bags contain 2 dark orange bags.',
               'dark orange bags contain 2 dark yellow bags.',
               'dark yellow bags contain 2 dark green bags.',
               'dark green bags contain 2 dark blue bags.',
               'dark blue bags contain 2 dark violet bags.',
               'dark violet bags contain no other bags.']
      expect(described_class.number_bags_needed(input)).to eq(126)
    end
  end
end
