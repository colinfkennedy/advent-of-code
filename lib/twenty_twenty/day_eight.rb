module TwentyTwenty
  class DayEight
    INSTRUCTION_REGEX = /(\w+) (\+|-)(\d+)/

    def self.acc_before_infinite_loop(input)
      indices_visited = []
      index = 0
      acc = 0

      while !indices_visited.include?(index)
        index, acc = process_instruction(acc, index, input[index], indices_visited)
      end

      acc
    end

    def self.acc_after_fixing(input)
      indices_visited = []
      index = 0
      acc = 0

      while !indices_visited.include?(index)
        index, acc = process_instruction(acc, index, input[index], indices_visited)
      end

      acc
    end

    private_class_method def self.process_instruction(acc, index, full_instruction, indices_visited)
      matched_instruction = full_instruction.match(INSTRUCTION_REGEX)
      indices_visited.push(index)
      case matched_instruction[1]
      when "acc"
        if matched_instruction[2] == "+"
          acc += matched_instruction[3].to_i
        else
          acc -= matched_instruction[3].to_i
        end
        index += 1
      when "jmp"
        if matched_instruction[2] == "+"
          index += matched_instruction[3].to_i
        else
          index -= matched_instruction[3].to_i
        end
      when "nop"
        index += 1
      end
      [index, acc]
    end
  end
end
