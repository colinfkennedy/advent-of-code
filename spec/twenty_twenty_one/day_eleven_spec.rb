require 'twenty_twenty_one/day_eleven'

describe TwentyTwentyOne::DayEleven do
  context 'with test input' do
    context 'smaller map' do
      it 'returns the correct map after one step' do
        input = %w[
          11111
          19991
          19191
          19991
          11111
        ]
        day_eleven = described_class.new(input)
        day_eleven.flash_count(1)
        expect(day_eleven.octopus_map.map { |row| row.map(&:energy) }).to eq(
          [
            [3, 4, 5, 4, 3],
            [4, 0, 0, 0, 4],
            [5, 0, 0, 0, 5],
            [4, 0, 0, 0, 4],
            [3, 4, 5, 4, 3]
          ]
        )
      end
      it 'returns the correct map after two steps' do
        input = %w[
          11111
          19991
          19191
          19991
          11111
        ]
        day_eleven = described_class.new(input)
        day_eleven.flash_count(2)
        expect(day_eleven.octopus_map.map { |row| row.map(&:energy) }).to eq(
          [
            [4, 5, 6, 5, 4],
            [5, 1, 1, 1, 5],
            [6, 1, 1, 1, 6],
            [5, 1, 1, 1, 5],
            [4, 5, 6, 5, 4]
          ]
        )
      end
    end
    it 'gets the answer 1656 for flashes after 100 steps' do
      input = %w[
        5483143223
        2745854711
        5264556173
        6141336146
        6357385478
        4167524645
        2176841721
        6882881134
        4846848554
        5283751526
      ]
      expect(described_class.new(input).flash_count(100)).to eq(1656)
    end

    it 'gets the answer 1656 for flashes after 100 steps' do
      input = %w[
        5483143223
        2745854711
        5264556173
        6141336146
        6357385478
        4167524645
        2176841721
        6882881134
        4846848554
        5283751526
      ]
      expect(described_class.new(input).simultaneous_flash_step).to eq(195)
    end
  end
end
