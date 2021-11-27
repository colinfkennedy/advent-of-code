require 'twenty_twenty/day_eleven'

describe TwentyTwenty::DayEleven do
  context 'with test input' do
    it 'returns 37 unoccupied seats' do
      input = [
        %w[L . L L . L L . L L],
        %w[L L L L L L L . L L],
        %w[L . L . L . . L . .],
        %w[L L L L . L L . L L],
        %w[L . L L . L L . L L],
        %w[L . L L L L L . L L],
        %w[. . L . L . . . . .],
        %w[L L L L L L L L L L],
        %w[L . L L L L L L . L],
        %w[L . L L L L L . L L]
      ]

      seat_finder = described_class.new(input)

      expect(seat_finder.occupied_seats).to eq(37)
    end
  end
end
