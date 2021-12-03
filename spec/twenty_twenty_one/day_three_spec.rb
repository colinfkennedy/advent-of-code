require 'twenty_twenty_one/day_three'

describe TwentyTwentyOne::DayThree do
  context 'with test input' do
    it 'gets the answer 198 for power consumption' do
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

  context 'with test input' do
    it 'gets the answer 230 for life_support_rating' do
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
      expect(described_class.new(input).life_support_rating).to eq(230)
    end
  end
end
