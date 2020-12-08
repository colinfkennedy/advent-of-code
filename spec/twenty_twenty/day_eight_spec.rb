require "twenty_twenty/day_eight"

describe TwentyTwenty::DayEight do

  context "with test input" do
    it "gets the answer 5 for acc before infinite loop" do
      input = ["nop +0",
               "acc +1",
               "jmp +4",
               "acc +3",
               "jmp -3",
               "acc -99",
               "acc +1",
               "jmp -4",
               "acc +6"]
      expect(described_class.acc_before_infinite_loop(input)).to eq(5)
    end

    it "gets the answer 8 for acc after fixing" do
      input = ["nop +0",
               "acc +1",
               "jmp +4",
               "acc +3",
               "jmp -3",
               "acc -99",
               "acc +1",
               "jmp -4",
               "acc +6"]
      expect(described_class.acc_after_fixing(input)).to eq(8)
    end

  end

end
