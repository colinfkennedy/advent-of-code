require "twenty_nineteen/day_one"

describe TwentyNineteen::DayOne do
  describe "#calculate_fuel" do
    context "with a mass of 12" do
      it "returns 2" do
        expect(described_class.calculate_fuel(mass: 12)).to eq(2)
      end
    end

    context "with a mass of 14" do
      it "returns 2" do
        expect(described_class.calculate_fuel(mass: 14)).to eq(2)
      end
    end

    context "with a mass of 1969" do
      it "returns 654" do
        expect(described_class.calculate_fuel(mass: 1969)).to eq(654)
      end
    end

    context "with a mass of 100756" do
      it "returns 33583" do
        expect(described_class.calculate_fuel(mass: 100756)).to eq(33583)
      end
    end
  end

  describe "#calculate_fuel_double" do
    context "with a mass of 14" do
      it "returns 2" do
        expect(described_class.calculate_fuel_double(mass: 14)).to eq(2)
      end
    end

    context "with a mass of 1969" do
      it "returns 966" do
        expect(described_class.calculate_fuel_double(mass: 1969)).to eq(966)
      end
    end

    context "with a mass of 100756" do
      it "returns 50346" do
        expect(described_class.calculate_fuel_double(mass: 100756)).to eq(50346)
      end
    end
  end
end
