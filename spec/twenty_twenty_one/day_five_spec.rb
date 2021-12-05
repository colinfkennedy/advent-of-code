require 'twenty_twenty_one/day_five'

describe TwentyTwentyOne::DayFive do
  context 'with test input' do
    it 'gets the answer 5 for overlapping points count' do
      input = [
        '0,9 -> 5,9',
        '8,0 -> 0,8',
        '9,4 -> 3,4',
        '2,2 -> 2,1',
        '7,0 -> 7,4',
        '6,4 -> 2,0',
        '0,9 -> 2,9',
        '3,4 -> 1,4',
        '0,0 -> 8,8',
        '5,5 -> 8,2'
      ]
      expect(described_class.new(input).overlapping_points_count).to eq(5)
    end

    it 'gets the answer 12 for overlapping points count with diagonals' do
      input = [
        '0,9 -> 5,9',
        '8,0 -> 0,8',
        '9,4 -> 3,4',
        '2,2 -> 2,1',
        '7,0 -> 7,4',
        '6,4 -> 2,0',
        '0,9 -> 2,9',
        '3,4 -> 1,4',
        '0,0 -> 8,8',
        '5,5 -> 8,2'
      ]
      expect(described_class.new(input, with_diagonals: true).overlapping_points_count).to eq(12)
    end
  end
end
