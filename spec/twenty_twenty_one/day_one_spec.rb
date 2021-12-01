require 'twenty_twenty_one/day_one'

describe TwentyTwentyOne::DayOne do
  context 'with test input' do
    it 'gets the answer 7 for depth increases' do
      input = [
        199,
        200,
        208,
        210,
        200,
        207,
        240,
        269,
        260,
        263
      ]
      expect(described_class.new(input).depth_increases).to eq(7)
    end
  end
end
