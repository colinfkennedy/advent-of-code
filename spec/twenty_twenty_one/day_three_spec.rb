require 'twenty_twenty_one/day_three'

describe TwentyTwentyOne::DayThree do
  context 'with test input' do
    it 'gets the answer 150 for product_of_depth_and_position' do
      input = %w[
        00100
        11110
        10110
        10111
        10101
        01111
        00111
        11100
        10000
        11001
        00010
        01010
      ]
      expect(described_class.new(input).power_consumption).to eq(198)
    end
  end
end
