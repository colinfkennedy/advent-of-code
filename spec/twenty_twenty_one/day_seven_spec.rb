require 'twenty_twenty_one/day_seven'

describe TwentyTwentyOne::DaySeven do
  context 'with test input' do
    it 'gets the answer 37 for least fuel used' do
      input = [
        '16,1,2,0,4,2,7,1,2,14'
      ]
      expect(described_class.new(input).align_least_fuel).to eq(37)
    end

    it 'gets the answer 168 for least fuel used with proper engineering' do
      input = [
        '16,1,2,0,4,2,7,1,2,14'
      ]
      expect(described_class.new(input).align_fuel_proper_engineering).to eq(168)
    end
  end
end
