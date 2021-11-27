require 'twenty_twenty/seat_finder'

describe TwentyTwenty::SeatFinder do
  describe '#find_adjacent_seats' do
    context 'when top left seat' do
      it 'returns the adjacent seats' do
        seat_map = [
          %w[. A X X X],
          %w[A A X X X],
          %w[X X X X X]
        ]

        adjacent_seats = described_class.new(seat_map).find_adjacent_seats(0, 0)

        expect(adjacent_seats).to match_array(%w[A A A])
      end
    end

    context 'when top right seat' do
      it 'returns the adjacent seats' do
        seat_map = [
          %w[X X X A .],
          %w[X X X A A],
          %w[X X X X X]
        ]

        adjacent_seats = described_class.new(seat_map).find_adjacent_seats(0, 4)

        expect(adjacent_seats).to match_array(%w[A A A])
      end
    end

    context 'when bottom left seat' do
      it 'returns the adjacent seats' do
        seat_map = [
          %w[X X X X X],
          %w[A A X X X],
          %w[. A X X X]
        ]

        adjacent_seats = described_class.new(seat_map).find_adjacent_seats(2, 0)

        expect(adjacent_seats).to match_array(%w[A A A])
      end
    end

    context 'when bottom right seat' do
      it 'returns the adjacent seats' do
        seat_map = [
          %w[X X X X X],
          %w[X X X A A],
          %w[X X X A .]
        ]

        adjacent_seats = described_class.new(seat_map).find_adjacent_seats(2, 4)

        expect(adjacent_seats).to match_array(%w[A A A])
      end
    end

    context 'when middle top seat' do
      it 'returns the adjacent seats' do
        seat_map = [
          %w[X A . A X],
          %w[X A A A X],
          %w[X X X X X]
        ]

        adjacent_seats = described_class.new(seat_map).find_adjacent_seats(0, 2)

        expect(adjacent_seats).to match_array(%w[A A A A A])
      end
    end

    context 'when middle bottom seat' do
      it 'returns the adjacent seats' do
        seat_map = [
          %w[X X X X X],
          %w[X A A A X],
          %w[X A . A X]
        ]

        adjacent_seats = described_class.new(seat_map).find_adjacent_seats(2, 2)

        expect(adjacent_seats).to match_array(%w[A A A A A])
      end
    end

    context 'when middle left seat' do
      it 'returns the adjacent seats' do
        seat_map = [
          %w[A A X X X],
          %w[. A X X X],
          %w[A A X X X]
        ]

        adjacent_seats = described_class.new(seat_map).find_adjacent_seats(1, 0)

        expect(adjacent_seats).to match_array(%w[A A A A A])
      end
    end

    context 'when middle right seat' do
      it 'returns the adjacent seats' do
        seat_map = [
          %w[X X X A A],
          %w[X X X A .],
          %w[X X X A A]
        ]

        adjacent_seats = described_class.new(seat_map).find_adjacent_seats(1, 4)

        expect(adjacent_seats).to match_array(%w[A A A A A])
      end
    end

    context 'when fully surrounded seat' do
      it 'returns the adjacent seats' do
        seat_map = [
          %w[X A A A X],
          %w[X A . A X],
          %w[X A A A X]
        ]

        adjacent_seats = described_class.new(seat_map).find_adjacent_seats(1, 2)

        expect(adjacent_seats).to match_array(%w[A A A A A A A A])
      end
    end
  end
end
