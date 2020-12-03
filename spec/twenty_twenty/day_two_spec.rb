require "twenty_twenty/day_two"

describe TwentyTwenty::DayTwo do

  context "with test input" do
    it "gets the answer 2 for correct passwords with range" do
      input = ["1-3 a: abcde", "1-3 b: cdefg", "2-9 c: ccccccccc"]
      expect(described_class.number_correct_passwords_range(input)).to eq(2)
    end

    it "gets the answer 1 for correct passwords with position" do
      input = ["1-3 a: abcde", "1-3 b: cdefg", "2-9 c: ccccccccc"]
      expect(described_class.number_correct_passwords_position(input)).to eq(1)
    end
  end
end
