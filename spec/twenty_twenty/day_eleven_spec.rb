require 'twenty_twenty/day_eleven'

describe TwentyTwenty::DayEleven do
  context 'with test input' do
    it 'returns 37 unoccupied seats' do
      input = <<~TEST_INPUT
        L.LL.LL.LL
        LLLLLLL.LL
        L.L.L..L..
        LLLL.LL.LL
        L.LL.LL.LL
        L.LLLLL.LL
        ..L.L.....
        LLLLLLLLLL
        L.LLLLLL.L
        L.LLLLL.LL
      TEST_INPUT

      seat_finder = described_class.new(input)

      expect(seat_finder.unoccupied_seats).to eq(37)
    end
  end
end
