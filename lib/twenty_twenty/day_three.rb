module TwentyTwenty
  class DayThree
    def self.number_of_trees(input, rotation_amount = 3)
      rotation = 0
      tree_count = 0
      input.each do |line|
        # puts "Line: #{line}"
        rotated = line.strip.split(//).rotate(rotation)
        # puts "Rotated: #{rotated}"
        tree_count += 1 if rotated.first === '#'
        rotation += rotation_amount
      end
      tree_count
    end

    def self.product_of_slopes(input)
      slope_one_count = number_of_trees(input, 1)
      slope_two_count = number_of_trees(input, 3)
      slope_three_count = number_of_trees(input, 5)
      slope_four_count = number_of_trees(input, 7)
      input_every_second = (0...input.size).step(2).map { |i| input[i] }
      # puts input_every_second
      slope_five_count = number_of_trees(input_every_second, 1)
      puts "#{slope_one_count} * #{slope_two_count} * #{slope_three_count} * #{slope_four_count} * #{slope_five_count}"
      slope_one_count * slope_two_count * slope_three_count * slope_four_count * slope_five_count
    end
  end
end
