require 'twenty_twenty_one/day_two'

describe TwentyTwentyOne::DayTwo do
  context 'with test input' do
    it 'gets the answer 150 for product_of_depth_and_position' do
      input = [
        'forward 5',
        'down 5',
        'forward 8',
        'up 3',
        'down 8',
        'forward 2'
      ]
      expect(described_class.new(input).product_of_depth_and_position).to eq(150)
    end

    it 'gets the answer 900 for product_of_depth_and_position_with_aim' do
      input = [
        'forward 5',
        'down 5',
        'forward 8',
        'up 3',
        'down 8',
        'forward 2'
      ]
      expect(described_class.new(input).product_of_depth_and_position_with_aim).to eq(900)
    end
  end
end
