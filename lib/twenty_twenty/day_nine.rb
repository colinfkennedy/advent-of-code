module TwentyTwenty
  class DayNine

    def self.find_first_invalid(input, preamble_length)
      preamble = []
      input = input.map(&:to_i)
      input.each do |number|
        if (preamble.length == preamble_length)
          if check_validity(number, preamble)
            preamble.push(number)
            preamble.shift
          else
            return number
          end
        else
          preamble.push(number)
        end
      end
    end

    def self.find_weakness(input, target)
      input = input.map(&:to_i)
      input.each_with_index do |number, index|
        range_upper_index = is_target?(index, input, number, target)
        unless range_upper_index.nil?
          range = input[index..(index + range_upper_index)]

          return range.min + range.max
        end
      end
    end

    private_class_method def self.check_validity(number, preamble)
      preamble.each_with_index do |first_number, index|
        preamble[index, preamble.length - 1].each do |second_number|
          return true if first_number + second_number == number
        end
      end
      false
    end
    private_class_method def self.is_target?(index, input, number, target)
      total = number
      input[index + 1, input.length - 1].each_with_index do |second_number, index|
        total += second_number
        return (index + 1) if total == target
        return nil if total > target
      end
    end

  end
end
