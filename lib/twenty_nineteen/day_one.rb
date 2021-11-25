module TwentyNineteen
  class DayOne
    def self.calculate_fuel(mass:)
      third_mass = mass / 3
      third_mass.floor - 2
    end

    def self.calculate_fuel_double(mass:)
      return 0 if mass < 7

      total_fuel = calculate_fuel(mass: mass)
      total_fuel += calculate_fuel_double(mass: total_fuel)
      total_fuel
    end
  end
end
