require 'twenty_twenty_one/day_six'

describe TwentyTwentyOne::DaySix do
  context 'with test input' do
    it 'gets the answer 26 for fish count after 18 days' do
      input = [
        '3,4,3,1,2'
      ]
      expect(described_class.new(input).fish_count(day: 18)).to eq(26)
    end

    it 'gets the answer 5934 for fish count after 80 days' do
      input = [
        '3,4,3,1,2'
      ]
      expect(described_class.new(input).fish_count(day: 80)).to eq(5934)
    end
  end
end
