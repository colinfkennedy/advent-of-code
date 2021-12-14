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

# require_relative 'day_five'

# puts 'Day Five - 2021'

# input_day_five = Read.get_input(filename: 'lib/input/2021/day-five.txt')

# puts "Overlapping points count: #{::TwentyTwentyOne::DayFive.new(input_day_five).overlapping_points_count}"

# puts "Overlapping points with diagonals count: #{::TwentyTwentyOne::DayFive.new(input_day_five, with_diagonals: true).overlapping_points_count}"

# require_relative 'day_six'

# puts 'Day Six - 2021'

# input_day_six = Read.get_input(filename: 'lib/input/2021/day-six.txt')

# puts "Fish count after 80 days: #{::TwentyTwentyOne::DaySix.new(input_day_six).fish_count(day: 80)}"

# puts "Fish count after 256 days: #{::TwentyTwentyOne::DaySix.new(input_day_six).fish_count(day: 256)}"

# require_relative 'day_seven'

# puts 'Day Seven - 2021'

# input_day_seven = Read.get_input(filename: 'lib/input/2021/day-seven.txt')

# puts "Least fuel: #{::TwentyTwentyOne::DaySeven.new(input_day_seven).align_least_fuel}"

# puts "Least fuel part 2: #{::TwentyTwentyOne::DaySeven.new(input_day_seven).align_fuel_proper_engineering}"

# require_relative 'day_eight'

# puts 'Day Eight - 2021'

# input_day_eight = Read.get_input(filename: 'lib/input/2021/day-eight.txt')

# puts "Unique segment digits in output: #{::TwentyTwentyOne::DayEight.new(input_day_eight).unique_segment_digits}"

# puts "Sum output values: #{::TwentyTwentyOne::DayEight.new(input_day_eight).sum_output_values}"

# require_relative 'day_nine'

# puts 'Day Nine - 2021'

# input_day_nine = Read.get_input(filename: 'lib/input/2021/day-nine.txt')

# puts "Risk level sum: #{::TwentyTwentyOne::DayNine.new(input_day_nine).risk_levels_sum}"

# puts "Largest basins product: #{::TwentyTwentyOne::DayNine.new(input_day_nine).largest_basins_product}"

# require_relative 'day_ten'

# puts 'Day Ten - 2021'

# input_day_ten = Read.get_input(filename: 'lib/input/2021/day-ten.txt')

# puts "Syntax error score: #{::TwentyTwentyOne::DayTen.new(input_day_ten).syntax_error_score}"

# puts "Autocomplete score: #{::TwentyTwentyOne::DayTen.new(input_day_ten).autocomplete_score}"

# require_relative 'day_eleven'

# puts 'Day Eleven - 2021'

# input_day_eleven = Read.get_input(filename: 'lib/input/2021/day-eleven.txt')

# puts "Flash count: #{::TwentyTwentyOne::DayEleven.new(input_day_eleven).flash_count(100)}"

# puts "Synchrnised step: #{::TwentyTwentyOne::DayEleven.new(input_day_eleven).simultaneous_flash_step}"

# require_relative 'day_twelve'

# puts 'Day Twelve - 2021'

# input_day_twelve = Read.get_input(filename: 'lib/input/2021/day-twelve.txt')

# puts "Paths count: #{::TwentyTwentyOne::DayTwelve.new(input_day_twelve).paths}"

# puts "Paths with double count: #{::TwentyTwentyOne::DayTwelve.new(input_day_twelve).paths(allow_double_visit: true)}"

# require_relative 'day_thirteen'

# puts 'Day Thirteen - 2021'

# input_day_thirteen = Read.get_input(filename: 'lib/input/2021/day-thirteen.txt')

# puts "Visible dot count: #{::TwentyTwentyOne::DayThirteen.new(input_day_thirteen).visible_dots}"

# puts "Final grid drawn: #{::TwentyTwentyOne::DayThirteen.new(input_day_thirteen).draw_after_all_folds}"

require_relative 'day_fourteen'

puts 'Day Fourteen - 2021'

input_day_fourteen = Read.get_input(filename: 'lib/input/2021/day-fourteen.txt')

puts "Polymer score after 10 steps min - max: #{::TwentyTwentyOne::DayFourteen.new(input_day_fourteen).polymer_score(steps: 10)}"
