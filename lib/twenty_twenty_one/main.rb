require_relative '../read'
# require_relative 'day_one'

# puts 'Day One - 2021'

# input_day_one = Read.get_input(filename: '../input/2021/day-one.txt').map(&:to_i)

# puts "Depth increases: #{::TwentyTwentyOne::DayOne.new(input_day_one).depth_increases}"

# puts "Depth increases with window: #{::TwentyTwentyOne::DayOne.new(input_day_one).window_depth_increases}"

# require_relative 'day_two'

# puts 'Day Two - 2021'

# input_day_two = Read.get_input(filename: '../input/2021/day-two.txt')

# puts "Product depth and position: #{::TwentyTwentyOne::DayTwo.new(input_day_two).product_of_depth_and_position}"

# puts "Product depth and position with aim: #{::TwentyTwentyOne::DayTwo.new(input_day_two).product_of_depth_and_position_with_aim}"

# require_relative 'day_three'

# puts 'Day Three - 2021'

# input_day_three = Read.get_input(filename: '../input/2021/day-three.txt')

# puts "Power consumption: #{::TwentyTwentyOne::DayThree.new(input_day_three).power_consumption}"

# puts "Life support rating: #{::TwentyTwentyOne::DayThree.new(input_day_three).life_support_rating}"

# require_relative 'day_four'

# puts 'Day Four - 2021'

# input_day_four = Read.get_input(filename: 'lib/input/2021/day-four.txt')

# puts "Winning board score: #{::TwentyTwentyOne::DayFour.new(input_day_four).winning_score}"

# puts "Last winning board score: #{::TwentyTwentyOne::DayFour.new(input_day_four).last_winning_score}"

require_relative 'day_five'

puts 'Day Five - 2021'

input_day_five = Read.get_input(filename: 'lib/input/2021/day-five.txt')

puts "Overlapping points count: #{::TwentyTwentyOne::DayFive.new(input_day_five).overlapping_points_count}"

puts "Overlapping points with diagonals count: #{::TwentyTwentyOne::DayFive.new(input_day_five,
                                                                 with_diagonals: true).overlapping_points_count}"
