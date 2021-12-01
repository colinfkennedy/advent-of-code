require_relative '../read'
require_relative 'day_one'

puts 'Day One - 2021'

input_day_one = Read.get_input(filename: '../input/2021/day-one.txt').map(&:to_i)

puts "Depth increases: #{::TwentyTwentyOne::DayOne.new(input_day_one).depth_increases}"
