require "twenty_twenty/passport"

describe TwentyTwenty::Passport do

  describe "#byr_is_valid?" do
    it "is false for more than 4 digits" do
      passport = described_class.new
      passport.byr = "20202"
      expect(passport.byr_is_valid?).to eq(false)
    end

    it "is false for less than 4 digits" do
      passport = described_class.new
      passport.byr = "202"
      expect(passport.byr_is_valid?).to eq(false)
    end

    it "is false for less than 1920" do
      passport = described_class.new
      passport.byr = "1919"
      expect(passport.byr_is_valid?).to eq(false)
    end

    it "is false for more than 2002" do
      passport = described_class.new
      passport.byr = "2003"
      expect(passport.byr_is_valid?).to eq(false)
    end

    it "is true for 1983" do
      passport = described_class.new
      passport.byr = "1983"
      expect(passport.byr_is_valid?).to eq(true)
    end
  end

  describe "#iyr_is_valid?" do
    it "is false for more than 4 digits" do
      passport = described_class.new
      passport.iyr = "20202"
      expect(passport.iyr_is_valid?).to eq(false)
    end

    it "is false for less than 4 digits" do
      passport = described_class.new
      passport.iyr = "202"
      expect(passport.iyr_is_valid?).to eq(false)
    end

    it "is false for less than 2010" do
      passport = described_class.new
      passport.iyr = "2009"
      expect(passport.iyr_is_valid?).to eq(false)
    end

    it "is false for more than 2020" do
      passport = described_class.new
      passport.iyr = "2021"
      expect(passport.iyr_is_valid?).to eq(false)
    end

    it "is true for 2019" do
      passport = described_class.new
      passport.iyr = "2019"
      expect(passport.iyr_is_valid?).to eq(true)
    end
  end

  describe "#eyr_is_valid?" do
    it "is false for more than 4 digits" do
      passport = described_class.new
      passport.eyr = "20202"
      expect(passport.eyr_is_valid?).to eq(false)
    end

    it "is false for less than 4 digits" do
      passport = described_class.new
      passport.eyr = "202"
      expect(passport.eyr_is_valid?).to eq(false)
    end

    it "is false for less than 2020" do
      passport = described_class.new
      passport.eyr = "2019"
      expect(passport.eyr_is_valid?).to eq(false)
    end

    it "is false for more than 2030" do
      passport = described_class.new
      passport.eyr = "2031"
      expect(passport.eyr_is_valid?).to eq(false)
    end

    it "is true for 2020" do
      passport = described_class.new
      passport.eyr = "2020"
      expect(passport.eyr_is_valid?).to eq(true)
    end
  end

  describe "#hgt_is_valid?" do
    it "is false for number without cm or in" do
      passport = described_class.new
      passport.hgt = "20202"
      expect(passport.hgt_is_valid?).to eq(false)
    end

    context "when cm" do
      it "is false for less than 150" do
        passport = described_class.new
        passport.hgt = "149cm"
        expect(passport.hgt_is_valid?).to eq(false)
      end

      it "is false for more than 193" do
        passport = described_class.new
        passport.hgt = "194cm"
        expect(passport.hgt_is_valid?).to eq(false)
      end

      it "is true for 193" do
        passport = described_class.new
        passport.hgt = "193cm"
        expect(passport.hgt_is_valid?).to eq(true)
      end
    end

    context "when in" do
      it "is false for less than 59" do
        passport = described_class.new
        passport.hgt = "58in"
        expect(passport.hgt_is_valid?).to eq(false)
      end

      it "is false for more than 76" do
        passport = described_class.new
        passport.hgt = "77in"
        expect(passport.hgt_is_valid?).to eq(false)
      end

      it "is true for 59" do
        passport = described_class.new
        passport.hgt = "59in"
        expect(passport.hgt_is_valid?).to eq(true)
      end
    end
  end

  describe "#hcl_is_valid?" do
    it "is false for invalid input" do
      passport = described_class.new
      passport.hcl = "20202"
      expect(passport.hcl_is_valid?).to eq(false)
    end

    it "is false for more than 6 chars after a hash" do
      passport = described_class.new
      passport.hcl = "#202025a"
      expect(passport.hcl_is_valid?).to eq(false)
    end

    it "is false for more 7 chars but no hash" do
      passport = described_class.new
      passport.hcl = "202025a"
      expect(passport.hcl_is_valid?).to eq(false)
    end

    it "is false for chars outside range" do
      passport = described_class.new
      passport.hcl = "#02025h"
      expect(passport.hcl_is_valid?).to eq(false)
    end

    it "is true for valid colour" do
      passport = described_class.new
      passport.hcl = "#02025a"
      expect(passport.hcl_is_valid?).to eq(true)
    end
  end

  describe "#ecl_is_valid?" do
    it "is false for invalid input" do
      passport = described_class.new
      passport.ecl = "jkl"
      expect(passport.ecl_is_valid?).to eq(false)
    end

    it "is true for valid input" do
      passport = described_class.new
      passport.ecl = "hzl"
      expect(passport.ecl_is_valid?).to eq(true)
    end
  end

  describe "#pid_is_valid?" do
    it "is false for invalid input" do
      passport = described_class.new
      passport.pid = "jkl"
      expect(passport.pid_is_valid?).to eq(false)
    end

    it "is true for valid input" do
      passport = described_class.new
      passport.pid = "000123456"
      expect(passport.pid_is_valid?).to eq(true)
    end
  end
end
