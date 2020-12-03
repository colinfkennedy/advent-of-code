require_relative "../read"
# require_relative "day_one"
require_relative "day_two"

# puts "Day One - 2020"
#
# input_day_one = Read.get_input(filename: "../input/2020/day-one.txt").map(&:to_i)
#
# # puts "Product of 2: #{::TwentyTwenty::DayOne.product_2_sum_2020(input_day_one)}"
#
# puts "Product of 3: #{::TwentyTwenty::DayOne.product_3_sum_2020(input_day_one)}"

puts "Day Two - 2020"

input_day_two = Read.get_input(filename: "../input/2020/day-two.txt")

# puts "Correct passwords range: #{TwentyTwenty::DayTwo.number_correct_passwords_range(input_day_two)}"

puts "Correct passwords position: #{TwentyTwenty::DayTwo.number_correct_passwords_position(input_day_two)}"
