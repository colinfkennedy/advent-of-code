require_relative "../read"
# require_relative "day_one"
# require_relative "day_two"
# require_relative "day_three"
# require_relative "day_four"
# require_relative "day_five"
# require_relative "day_six"
require_relative "day_seven"

# puts "Day One - 2020"
#
# input_day_one = Read.get_input(filename: "../input/2020/day-one.txt").map(&:to_i)
#
# # puts "Product of 2: #{::TwentyTwenty::DayOne.product_2_sum_2020(input_day_one)}"
#
# puts "Product of 3: #{::TwentyTwenty::DayOne.product_3_sum_2020(input_day_one)}"

# puts "Day Two - 2020"
#
# input_day_two = Read.get_input(filename: "../input/2020/day-two.txt")

# puts "Correct passwords range: #{TwentyTwenty::DayTwo.number_correct_passwords_range(input_day_two)}"

# puts "Correct passwords position: #{TwentyTwenty::DayTwo.number_correct_passwords_position(input_day_two)}"

# puts "Day Three - 2020"
#
# input_day_three = Read.get_input(filename: "../input/2020/day-three.txt")
#
# # puts "Tree count: #{TwentyTwenty::DayThree.number_of_trees(input_day_three)}"
#
# puts "Product of slopes: #{TwentyTwenty::DayThree.product_of_slopes(input_day_three)}"

# puts "Day Four - 2020"
#
# input_day_four = Read.get_input(filename: "../input/2020/day-four.txt")
#
# TwentyTwenty::DayFour.count_valid_passports(input_day_four)

# puts "Day Five - 2020"
#
# input_day_five = Read.get_input(filename: "../input/2020/day-five.txt")
#
# # puts "Highest seat id: #{TwentyTwenty::DayFive.highest_seat_id(input_day_five)}"
#
# puts "My seat id: #{TwentyTwenty::DayFive.my_seat_id(input_day_five)}"

# puts "Day Six - 2020"
#
# input_day_six = Read.get_input(filename: "../input/2020/day-six.txt")
#
# puts "Affirmative Questions: #{TwentyTwenty::DaySix.count_affirmative_questions(input_day_six)}"

puts "Day Seven - 2020"

input_day_seven = Read.get_input(filename: "../input/2020/day-seven.txt")

puts "Bag count: #{TwentyTwenty::DaySeven.count_container_bags(input_day_seven)}"
