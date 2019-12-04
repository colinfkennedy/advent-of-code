require "day_three/point"

describe DayThree::Point do
  context "with point x:1, y:2" do
    it "returns the correct coordinates" do
      expect(point.x).to eq(1)
      expect(point.y).to eq(2)
    end

    context "with another point x:1, y:2" do
      it "returns true for ==" do
        point == point_2
        expect(point == point_2).to be(true)
      end

      def point_2
        @point_2 ||= described_class.new(x: 1, y: 2)
      end
    end

    context "with another point x:2, y:2" do
      it "returns false for ==" do
        point == point_2
        expect(point == point_2).to be(false)
      end

      def point_2
        @point_2 ||= described_class.new(x: 2, y: 2)
      end
    end

    def point
      @point ||= described_class.new(x: 1, y: 2)
    end
  end
end