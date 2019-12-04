require 'day_three/grid'

describe DayThree::Grid do
  context "with wires R8,U5,L5,D3 and U7,R6,D4,L4" do
    it "returns 6 as closest crossing point" do
      grid = described_class.new(["R8,U5,L5,D3", "U7,R6,D4,L4"])
      expect(grid.closest_cross_distance).to eq(6)
    end
  end

  context "with wires R75,D30,R83,U83,L12,D49,R71,U7,L72 and U62,R66,U55,R34,D71,R55,D58,R83" do
    it "returns 159 as closest crossing point" do
      grid = described_class.new(["R75,D30,R83,U83,L12,D49,R71,U7,L72", "U62,R66,U55,R34,D71,R55,D58,R83"])
      expect(grid.closest_cross_distance).to eq(159)
    end
  end

  context "with wires R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51 and U98,R91,D20,R16,D67,R40,U7,R15,U6,R7" do
    it "returns 135 as closest crossing point" do
      grid = described_class.new(["R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51", "U98,R91,D20,R16,D67,R40,U7,R15,U6,R7"])
      expect(grid.closest_cross_distance).to eq(135)
    end
  end
end