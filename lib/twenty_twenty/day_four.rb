require_relative "passport"

module TwentyTwenty
  class DayFour

    def self.count_valid_passports(input)
      passports_processed_count = 0
      valid_passports_count = 0
      passport = Passport.new
      input.each do |line|
        line = line.strip
        if !line.empty?
          passport.parse_line(line)
        else
          passports_processed_count += 1
          valid_passports_count += 1 if passport.is_valid?
          passport = Passport.new
        end
      end
      passports_processed_count += 1
      valid_passports_count += 1 if passport.is_valid?
      puts "Total passports processed: #{passports_processed_count}. Valid: #{valid_passports_count}"
      valid_passports_count
    end

  end
end
