require 'twenty_twenty/day_eleven'

describe TwentyTwenty::DayTen do
  context 'with test input' do
    it 'returns 37 unoccupied seats' do
      seat_finder = described_class.new(input)
      expect(seat_finder.unoccupied_seats).to eq(37)
    end
  end
end
