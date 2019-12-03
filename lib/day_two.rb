class DayTwo
  Terminate = StandardError.new("Terminate")

  def self.calculate(opcode:, value_1: 0, value_2: 0)
    if opcode == 1
      #puts "Adding"
      total = value_1 + value_2
      #puts "Total = #{total}"
      return total
    elsif opcode ==2
      #puts "Multiplying"
      total = value_1 * value_2
      #puts "Total = #{total}"
      return total
    else
      raise "Error #{opcode}"
    end
  end

  def self.process(input:, offset: 0)
    #puts "Processing offset: #{offset}"
    opcode = input[offset]
    raise TerminateException if opcode == 99
    pos_1 = input[offset + 1]
    pos_2 = input[offset + 2]
    output_pos = input[offset + 3]
    #puts "Opcode: #{opcode} value_1: #{input[pos_1]} value_2 #{input[pos_2]}"
    input[output_pos] = calculate(opcode: opcode, value_1: input[pos_1], value_2: input[pos_2])
    process(input: input, offset: offset + 4)
  rescue TerminateException
    #puts "Terminate"
    #puts "Final Input:"
    #puts input
    input
  end

  def self.process_two(input:)
    (1..99).each do |noun|
      (1..99).each do |verb|
        new_input = input.clone
        new_input[1] = noun
        new_input[2] = verb
        output = process(input: new_input)
        puts "Output: #{output[0]}"
        if output[0] == 19690720
          puts "Found!"
          puts "Noun: #{noun} Verb: #{verb}"
          puts " 100 * noun + verb = #{100 * noun + verb}"
          return
        end
      end
    end
  end
end

class TerminateException < StandardError
end