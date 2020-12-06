require "twenty_twenty/day_six"

describe TwentyTwenty::DaySix do

  context "with test input" do
    it "gets the answer 11 for affirmative questions" do
      input = ["abc",
               "",
               "a",
               "b",
               "c",
               "",
               "ab",
               "ac",
               "",
               "a",
               "a",
               "a",
               "a",
               "",
               "b"]
      expect(described_class.count_affirmative_questions(input)).to eq(11)
    end

    it "gets the answer 6 for everyone affirmative questions" do
      input = ["abc",
               "",
               "a",
               "b",
               "c",
               "",
               "ab",
               "ac",
               "",
               "a",
               "a",
               "a",
               "a",
               "",
               "b"]
      expect(described_class.count_everyone_affirmative_questions(input)).to eq(6)
    end

  end
end
