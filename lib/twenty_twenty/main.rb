require_relative "../read"
require_relative "day_one"

puts "Day One - 2020"

input_day_one = Read.get_input(filename: "../input/2020/day-one.txt").map(&:to_i)

# puts "Product of 2: #{::TwentyTwenty::DayOne.product_2_sum_2020(input_day_one)}"

puts "Product of 3: #{::TwentyTwenty::DayOne.product_3_sum_2020(input_day_one)}"
