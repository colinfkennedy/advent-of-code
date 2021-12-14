require 'twenty_twenty_one/day_fourteen'

describe TwentyTwentyOne::DayFourteen do
  context 'with test input' do
    # it 'gets NCNBCHB after 1 step' do
    #   input = [
    #     'NNCB',
    #     '',
    #     'CH -> B',
    #     'HH -> N',
    #     'CB -> H',
    #     'NH -> C',
    #     'HB -> C',
    #     'HC -> B',
    #     'HN -> C',
    #     'NN -> C',
    #     'BH -> H',
    #     'NC -> B',
    #     'NB -> B',
    #     'BN -> B',
    #     'BB -> N',
    #     'BC -> B',
    #     'CC -> N',
    #     'CN -> C'
    #   ]
    #   polymer_calculator = described_class.new(input)
    #   polymer_calculator.step(1)
    #   expect(polymer_calculator.polymer).to eq('NCNBCHB')
    # end

    # it 'gets NBCCNBBBCBHCB after 2 steps' do
    #   input = [
    #     'NNCB',
    #     '',
    #     'CH -> B',
    #     'HH -> N',
    #     'CB -> H',
    #     'NH -> C',
    #     'HB -> C',
    #     'HC -> B',
    #     'HN -> C',
    #     'NN -> C',
    #     'BH -> H',
    #     'NC -> B',
    #     'NB -> B',
    #     'BN -> B',
    #     'BB -> N',
    #     'BC -> B',
    #     'CC -> N',
    #     'CN -> C'
    #   ]
    #   polymer_calculator = described_class.new(input)
    #   polymer_calculator.step(2)
    #   expect(polymer_calculator.polymer).to eq('NBCCNBBBCBHCB')
    # end

    # it 'gets NBBBCNCCNBBNBNBBCHBHHBCHB after 3 steps' do
    #   input = [
    #     'NNCB',
    #     '',
    #     'CH -> B',
    #     'HH -> N',
    #     'CB -> H',
    #     'NH -> C',
    #     'HB -> C',
    #     'HC -> B',
    #     'HN -> C',
    #     'NN -> C',
    #     'BH -> H',
    #     'NC -> B',
    #     'NB -> B',
    #     'BN -> B',
    #     'BB -> N',
    #     'BC -> B',
    #     'CC -> N',
    #     'CN -> C'
    #   ]
    #   polymer_calculator = described_class.new(input)
    #   polymer_calculator.step(3)
    #   expect(polymer_calculator.polymer).to eq('NBBBCNCCNBBNBNBBCHBHHBCHB')
    # end

    # it 'gets NBBNBNBBCCNBCNCCNBBNBBNBBBNBBNBBCBHCBHHNHCBBCBHCB after 4 steps' do
    #   input = [
    #     'NNCB',
    #     '',
    #     'CH -> B',
    #     'HH -> N',
    #     'CB -> H',
    #     'NH -> C',
    #     'HB -> C',
    #     'HC -> B',
    #     'HN -> C',
    #     'NN -> C',
    #     'BH -> H',
    #     'NC -> B',
    #     'NB -> B',
    #     'BN -> B',
    #     'BB -> N',
    #     'BC -> B',
    #     'CC -> N',
    #     'CN -> C'
    #   ]
    #   polymer_calculator = described_class.new(input)
    #   polymer_calculator.step(4)
    #   expect(polymer_calculator.polymer).to eq('NBBNBNBBCCNBCNCCNBBNBBNBBBNBBNBBCBHCBHHNHCBBCBHCB')
    # end

    it 'gets the answer 1588 after 10 steps' do
      input = [
        'NNCB',
        '',
        'CH -> B',
        'HH -> N',
        'CB -> H',
        'NH -> C',
        'HB -> C',
        'HC -> B',
        'HN -> C',
        'NN -> C',
        'BH -> H',
        'NC -> B',
        'NB -> B',
        'BN -> B',
        'BB -> N',
        'BC -> B',
        'CC -> N',
        'CN -> C'
      ]
      expect(described_class.new(input).polymer_score(steps: 10)).to eq(1588)
    end

    it 'gets the answer 2188189693529 after 40 steps' do
      input = [
        'NNCB',
        '',
        'CH -> B',
        'HH -> N',
        'CB -> H',
        'NH -> C',
        'HB -> C',
        'HC -> B',
        'HN -> C',
        'NN -> C',
        'BH -> H',
        'NC -> B',
        'NB -> B',
        'BN -> B',
        'BB -> N',
        'BC -> B',
        'CC -> N',
        'CN -> C'
      ]
      expect(described_class.new(input).polymer_score(steps: 40)).to eq(2_188_189_693_529)
    end
  end
end
