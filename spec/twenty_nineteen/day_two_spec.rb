require "twenty_nineteen/day_two"

describe TwentyNineteen::DayTwo do
  describe "#process" do
    context "1,9,10,3,2,3,11,0,99,30,40,50" do
      it "returns 3500,9,10,70,2,3,11,0,99,30,40,50" do
        input = "1,9,10,3,2,3,11,0,99,30,40,50".split(',').map(&:to_i)
        expect(described_class.process(input: input)).to eq("3500,9,10,70,2,3,11,0,99,30,40,50")
      end
    end

    context "1,0,0,0,99" do
      it "returns 2,0,0,0,99" do
        input = "1,0,0,0,99".split(',').map(&:to_i)
        expect(described_class.process(input: input)).to eq("2,0,0,0,99")
      end
    end

    context "2,3,0,3,99" do
      it "returns 2,3,0,6,99" do
        input = "2,3,0,3,99".split(',').map(&:to_i)
        expect(described_class.process(input: input)).to eq("2,3,0,6,99")
      end
    end

    context "2,4,4,5,99,0" do
      it "returns 2,4,4,5,99,9801" do
        input = "2,4,4,5,99,0".split(',').map(&:to_i)
        expect(described_class.process(input: input)).to eq("2,4,4,5,99,9801")
      end
    end

    context "1,1,1,4,99,5,6,0,99" do
      it "returns 30,1,1,4,2,5,6,0,99" do
        input = "1,1,1,4,99,5,6,0,99".split(',').map(&:to_i)
        expect(described_class.process(input: input)).to eq("30,1,1,4,2,5,6,0,99")
      end
    end
  end
end
