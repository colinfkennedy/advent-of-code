require_relative "read"
require_relative "day_one"

puts "Day One"

input_day_one = Read.get_input(filename: "input/day-one-input.txt").map(&:to_i)

total_fuel = []
input_day_one.each do |mass|
  total_fuel.push(DayOne.calculate_fuel(mass: mass))
end

puts "Total fuel array: #{total_fuel}"
puts "Total fuel: #{total_fuel.sum}"

total_fuel_array = []
input_day_one.each do |mass|
  total_fuel_array.push(DayOne.calculate_fuel_double(mass: mass))
end

puts "Total fuel double array: #{total_fuel_array}"
puts "Total fuel double: #{total_fuel_array.sum}"