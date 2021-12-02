require_relative '../read'
# require_relative 'day_one'

# puts 'Day One - 2021'

# input_day_one = Read.get_input(filename: '../input/2021/day-one.txt').map(&:to_i)

# puts "Depth increases: #{::TwentyTwentyOne::DayOne.new(input_day_one).depth_increases}"

# puts "Depth increases with window: #{::TwentyTwentyOne::DayOne.new(input_day_one).window_depth_increases}"

require_relative 'day_two'

puts 'Day Two - 2021'

input_day_two = Read.get_input(filename: '../input/2021/day-two.txt')

puts "Product depth and position: #{::TwentyTwentyOne::DayTwo.new(input_day_two).product_of_depth_and_position}"
