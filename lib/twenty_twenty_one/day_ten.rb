module TwentyTwentyOne
  class DayTen
    attr_reader :input, :corrupt_chars, :autocomplete_scores

    SYNTAX_ERROR_SCORES = {
      ')' => 3,
      ']' => 57,
      '}' => 1197,
      '>' => 25_137
    }

    AUTOCOMPLETE_SCORES = {
      ')' => 1,
      ']' => 2,
      '}' => 3,
      '>' => 4
    }

    MATCHING_BRACKET_PAIRS = {
      '(' => ')',
      '[' => ']',
      '{' => '}',
      '<' => '>'
    }

    def initialize(input)
      @input = input
      @corrupt_chars = []
      @autocomplete_scores = []
      decode_input
    end

    def syntax_error_score
      puts "Corrupt chars: #{corrupt_chars}"
      corrupt_chars.map { |char| SYNTAX_ERROR_SCORES[char] }.sum
    end

    def autocomplete_score
      puts "Autocomplete scores: #{autocomplete_scores}"
      median(autocomplete_scores)
    end

    def decode_input
      input.each_with_index do |line, _index|
        open_chunks = []
        corrupt_line = false
        line.chars.each do |char|
          case char
          when '(', '[', '{', '<'
            open_chunks << char
          when ')', ']', '}', '>'
            last_open_chunk = open_chunks.pop
            if are_not_pair?(last_open_chunk, char)
              corrupt_chars << char
              corrupt_line = true
              break
            end
          end
        end
        autocomplete_scores << calculate_autocomplete_score(open_chunks) if open_chunks.any? && !corrupt_line
      end
    end

    def completion_string_score(line)
      open_chunks = []
      line.chars.each do |char|
        case char
        when '(', '[', '{', '<'
          open_chunks << char
        when ')', ']', '}', '>'
          last_open_chunk = open_chunks.pop
          if are_not_pair?(last_open_chunk, char)
            corrupt_chars << char
            break
          end
        end
      end
      calculate_autocomplete_score(open_chunks)
    end

    private def calculate_autocomplete_score(open_chunks)
      open_chunks.reverse.map { |chunk| MATCHING_BRACKET_PAIRS[chunk] }.inject(0) do |sum, close_bracket|
        (sum * 5) + AUTOCOMPLETE_SCORES[close_bracket]
      end
    end

    private def are_not_pair?(open_chunk, close_chunk)
      MATCHING_BRACKET_PAIRS[open_chunk] != close_chunk
    end

    private def median(array)
      return nil if array.empty?

      sorted = array.sort
      len = sorted.length
      (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
    end
  end
end
