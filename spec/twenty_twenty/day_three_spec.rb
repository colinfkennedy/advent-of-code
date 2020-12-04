require "twenty_twenty/day_three"

describe TwentyTwenty::DayThree do

  context "with test input" do
    it "gets the answer 7 for number of trees" do
      input = ["..##.......", "#...#...#..", ".#....#..#.", "..#.#...#.#", ".#...##..#.", "..#.##.....",
        ".#.#.#....#", ".#........#", "#.##...#...", "#...##....#", ".#..#...#.#"]
      expect(described_class.number_of_trees(input)).to eq(7)
    end

    it "gets the answer 336 for product of slopes" do
      input = ["..##.......", "#...#...#..", ".#....#..#.", "..#.#...#.#", ".#...##..#.", "..#.##.....",
               ".#.#.#....#", ".#........#", "#.##...#...", "#...##....#", ".#..#...#.#"]
      expect(described_class.product_of_slopes(input)).to eq(336)
    end

  end
end
