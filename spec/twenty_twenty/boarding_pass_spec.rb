require "twenty_twenty/boarding_pass"

describe TwentyTwenty::BoardingPass do

  context "with input FBFBBFFRLR" do
    it "has row 44, column 70 and seat ID 820" do
      boarding_pass = described_class.new("FBFBBFFRLR")
      expect(boarding_pass.row).to eq(44)
      expect(boarding_pass.column).to eq(5)
      expect(boarding_pass.seat_id).to eq(357)
    end
  end

  context "with input BFFFBBFRRR" do
    it "has row 70, column 7 and seat ID 567" do
      boarding_pass = described_class.new("BFFFBBFRRR")
      expect(boarding_pass.row).to eq(70)
      expect(boarding_pass.column).to eq(7)
      expect(boarding_pass.seat_id).to eq(567)
    end
  end

  context "with input FFFBBBFRRR" do
    it "has row 14, column 7 and seat ID 119" do
      boarding_pass = described_class.new("FFFBBBFRRR")
      expect(boarding_pass.row).to eq(14)
      expect(boarding_pass.column).to eq(7)
      expect(boarding_pass.seat_id).to eq(119)
    end
  end

  context "with input BBFFBBFRLL" do
    it "has row 102, column 4 and seat ID 820" do
      boarding_pass = described_class.new("BBFFBBFRLL")
      expect(boarding_pass.row).to eq(102)
      expect(boarding_pass.column).to eq(4)
      expect(boarding_pass.seat_id).to eq(820)
    end
  end

end
