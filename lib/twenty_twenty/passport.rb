module TwentyTwenty
  class Passport
    attr_accessor :byr, :iyr, :eyr, :hgt, :hcl, :ecl, :pid, :cid

    def parse_line(line)
      line.split(" ").each do |field_value|
        field, value = field_value.split(":")
        instance_variable_set("@#{field}", value)
      end
    end

    def is_valid?
      puts "byr: #{byr}, iyr: #{iyr}, eyr: #{eyr}, hgt: #{hgt}, ecl: #{ecl}, pid: #{pid}, cid: #{cid}"
      if byr.nil?
        puts "Missing byr"
      elsif iyr.nil?
        puts "Missing iyr"
      elsif eyr.nil?
        puts "Missing eyr"
      elsif hgt.nil?
        puts "Missing hgt"
      elsif hcl.nil?
        puts "Missing hcl"
      elsif ecl.nil?
        puts "Missing ecl"
      elsif pid.nil?
        puts "Missing pid"
      elsif cid.nil?
        puts "Missing cid - that's ok"
      end
      valid = !(byr.nil? || iyr.nil? || eyr.nil? || hgt.nil? || hcl.nil? || ecl.nil? || pid.nil?)
      puts "Valid: #{valid}"
      valid
    end

    def has_valid_criteria?
      byr_is_valid? && iyr_is_valid? && eyr_is_valid? && hgt_is_valid? && hcl_is_valid? && ecl_is_valid? && pid_is_valid?
    end


  end
end
