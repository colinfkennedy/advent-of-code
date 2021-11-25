module TwentyTwenty
  class DayEight
    INSTRUCTION_REGEX = /(\w+) (\+|-)(\d+)/

    def self.acc_before_infinite_loop(input)
      indices_visited = []
      index = 0
      acc = 0

      index, acc = process_instruction(acc, index, input[index], indices_visited) until indices_visited.include?(index)

      acc
    end

    def self.acc_after_fixing(input)
      completed = false
      acc = 0
      change_instruction_number = 1
      while completed == false
        changed_input = change_instruction(input, change_instruction_number)
        acc, completed = trial_instruction_set(changed_input)
        change_instruction_number += 1
      end
      acc
    end

    def self.change_instruction(input, change_instruction_number)
      instruction_placement = 0
      input.each_with_index do |instruction, index|
        matched_instruction = instruction.match(INSTRUCTION_REGEX)
        next unless matched_instruction[1] === 'jmp' || matched_instruction[1] === 'nop'

        instruction_placement += 1
        next unless instruction_placement == change_instruction_number

        changed_input = input.clone
        changed_input[index] =
          "#{matched_instruction[1] === 'jmp' ? 'nop' : 'jmp'} #{matched_instruction[2]}#{matched_instruction[3]}"
        return changed_input
      end
    end

    def self.trial_instruction_set(input)
      indices_visited = []
      index = 0
      acc = 0

      while !indices_visited.include?(index) && !(index >= input.size)
        index, acc = process_instruction(acc, index, input[index], indices_visited)
      end

      [acc, index == input.size]
    end

    private_class_method def self.process_instruction(acc, index, full_instruction, indices_visited)
      matched_instruction = full_instruction.match(INSTRUCTION_REGEX)
      indices_visited.push(index)
      case matched_instruction[1]
      when 'acc'
        if matched_instruction[2] == '+'
          acc += matched_instruction[3].to_i
        else
          acc -= matched_instruction[3].to_i
        end
        index += 1
      when 'jmp'
        if matched_instruction[2] == '+'
          index += matched_instruction[3].to_i
        else
          index -= matched_instruction[3].to_i
        end
      when 'nop'
        index += 1
      end
      [index, acc]
    end
  end
end
