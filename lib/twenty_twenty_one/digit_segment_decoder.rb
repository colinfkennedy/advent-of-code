module TwentyTwentyOne
  class DigitSegmentDecoder
    attr_reader :decoded_segments_map, :encoded_digits

    DIGITS = {
      'cf' => 1,
      'acdeg' => 2,
      'acdfg' => 3,
      'bcdf' => 4,
      'abdfg' => 5,
      'abdefg' => 6,
      'acf' => 7,
      'abcdefg' => 8,
      'abcdfg' => 9,
      'abcefg' => 0
    }

    def initialize(input)
      @encoded_digits = input.split('|').flatten.first.split(' ')
      @encoded_ouput_digits = input.split('|')[1].split(' ')
      @decoded_segments_map = create_decode_map
    end

    def decode_output_digits
      @encoded_ouput_digits.map do |digit|
        get_integer_from_encoded_digit(digit, @decoded_segments_map)
      end.join.to_i
    end

    def create_decode_map
      a = determine_a
      b, d = determine_b_d
      c, f = determine_c_f
      e, g = determine_e_g
      decode_map = {
        a => 'a',
        b => 'b',
        c => 'c',
        d => 'd',
        e => 'e',
        f => 'f',
        g => 'g'
      }
      chars_to_swap = [[b, d], [c, f], [e, g]].permutation.to_a.flatten(1)

      chars_to_swap.each do |char_pair|
        char_one, char_two = char_pair

        swap_chars(char_one, char_two, decode_map)

        break if test_decoded_map(decode_map)
      end

      decode_map
    end

    def swap_chars(char_1, char_2, decode_map)
      new_char_1 = decode_map[char_2]
      new_char_2 = decode_map[char_1]
      decode_map[char_1] = new_char_1
      decode_map[char_2] = new_char_2
    end

    def decode(encoded_digit, decoded_map)
      decoded_string = ''
      encoded_digit.each_char { |encoded_char| decoded_string += decoded_map[encoded_char] }
      decoded_string.chars.sort.join
    end

    def determine_a
      encoded_one = encoded_digits.find { |digit| digit.size == 2 }
      encoded_seven = encoded_digits.find { |digit| digit.size == 3 }

      encoded_seven.delete(encoded_one)
    end

    def determine_c_f
      encoded_digits.find { |digit| digit.size == 2 }.chars
    end

    def determine_b_d
      encoded_one = encoded_digits.find { |digit| digit.size == 2 }
      encoded_four = encoded_digits.find { |digit| digit.size == 4 }

      encoded_four.delete(encoded_one).chars
    end

    def determine_e_g
      a = determine_a
      encoded_four = encoded_digits.find { |digit| digit.size == 4 }
      encoded_eight = encoded_digits.find { |digit| digit.size == 7 }

      encoded_eight.delete(encoded_four).delete(a).chars
    end

    def test_decoded_map(decoded_map)
      encoded_digits.none? do |digit|
        get_integer_from_encoded_digit(digit, decoded_map).nil?
      end
    end

    def get_integer_from_encoded_digit(digit, decoded_map)
      DIGITS[decode(digit, decoded_map)]
    end
  end
end
