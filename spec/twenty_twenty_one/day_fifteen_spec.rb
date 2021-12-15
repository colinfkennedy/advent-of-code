require 'twenty_twenty_one/day_fifteen'

describe TwentyTwentyOne::DayFifteen do
  context 'with test input' do
    it 'gets the answer 40 for lowest_risk_path_cost' do
      input = %w[
        1163751742
        1381373672
        2136511328
        3694931569
        7463417111
        1319128137
        1359912421
        3125421639
        1293138521
        2311944581
      ]
      expect(described_class.new(input).lowest_risk_path_cost).to eq(40)
    end

    it 'gets the answer 315 for lowest_risk_path_cost for larger map' do
      input = %w[
        1163751742
        1381373672
        2136511328
        3694931569
        7463417111
        1319128137
        1359912421
        3125421639
        1293138521
        2311944581
      ]
      expect(described_class.new(input, large_path: true).lowest_risk_path_cost).to eq(315)
    end
  end
end
