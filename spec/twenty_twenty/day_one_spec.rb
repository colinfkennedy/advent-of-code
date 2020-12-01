require "twenty_twenty/day_one"

describe TwentyTwenty::DayOne do

  context "with test input" do
    it "gets the answer 514579 for two product" do
      input = [1721, 979, 366, 299, 675, 1456]
      expect(described_class.product_2_sum_2020(input)).to eq(514579)
    end

    it "gets the answer 241861950 for three product" do
      input = [1721, 979, 366, 299, 675, 1456]
      expect(described_class.product_3_sum_2020(input)).to eq(241861950)
    end
  end
end
