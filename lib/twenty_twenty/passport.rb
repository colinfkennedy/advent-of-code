module TwentyTwenty
  class Passport
    attr_accessor :byr, :iyr, :eyr, :hgt, :hcl, :ecl, :pid, :cid

    HEIGHT_REGEXP = /(\d+)(cm|in)/
    HAIRCOlOUR_REGEXP = /#([0-9]|[a-f]){6}/
    EYECOlOUR_REGEXP = /(amb|blu|brn|gry|grn|hzl|oth){1}/
    PID_REGEXP = /\d{9}/

    def parse_line(line)
      line.split(' ').each do |field_value|
        field, value = field_value.split(':')
        instance_variable_set("@#{field}", value)
      end
    end

    def is_valid?
      puts "byr: #{byr}, iyr: #{iyr}, eyr: #{eyr}, hgt: #{hgt}, ecl: #{ecl}, pid: #{pid}, cid: #{cid}"
      if byr.nil?
        puts 'Missing byr'
      elsif iyr.nil?
        puts 'Missing iyr'
      elsif eyr.nil?
        puts 'Missing eyr'
      elsif hgt.nil?
        puts 'Missing hgt'
      elsif hcl.nil?
        puts 'Missing hcl'
      elsif ecl.nil?
        puts 'Missing ecl'
      elsif pid.nil?
        puts 'Missing pid'
      elsif cid.nil?
        puts "Missing cid - that's ok"
      end
      valid = !(byr.nil? || iyr.nil? || eyr.nil? || hgt.nil? || hcl.nil? || ecl.nil? || pid.nil?)
      puts "Valid: #{valid}"
      valid
    end

    def has_valid_criteria?
      is_valid? && byr_is_valid? && iyr_is_valid? && eyr_is_valid? && hgt_is_valid? && hcl_is_valid? && ecl_is_valid? && pid_is_valid?
    end

    def byr_is_valid?
      return false if byr.size != 4
      return false if byr.to_i < 1920 || byr.to_i > 2002

      true
    end

    def iyr_is_valid?
      return false if iyr.size != 4
      return false if iyr.to_i < 2010 || iyr.to_i > 2020

      true
    end

    def eyr_is_valid?
      return false if eyr.size != 4
      return false if eyr.to_i < 2020 || eyr.to_i > 2030

      true
    end

    def hgt_is_valid?
      matched = hgt.match(HEIGHT_REGEXP)

      if matched.nil?
        false
      else
        height = matched[1].to_i
        if matched[2] == 'cm'
          height >= 150 && height <= 193
        else
          height >= 59 && height <= 76
        end
      end
    end

    def hcl_is_valid?
      return false if hcl.size != 7

      hcl.match?(HAIRCOlOUR_REGEXP)
    end

    def ecl_is_valid?
      return false if ecl.size != 3

      ecl.match?(EYECOlOUR_REGEXP)
    end

    def pid_is_valid?
      return false if pid.size != 9

      pid.match?(PID_REGEXP)
    end
  end
end
