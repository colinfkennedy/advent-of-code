require 'twenty_twenty_one/day_nine'

describe TwentyTwentyOne::DayNine do
  context 'with test input' do
    it 'gets the answer 15 for risk levels sum' do
      input = %w[
        2199943210
        3987894921
        9856789892
        8767896789
        9899965678
      ]
      expect(described_class.new(input).risk_levels_sum).to eq(15)
    end

    it 'gets the answer 1134 for three largest basins product' do
      input = %w[
        2199943210
        3987894921
        9856789892
        8767896789
        9899965678
      ]
      expect(described_class.new(input).largest_basins_product).to eq(1134)
    end
  end
end
