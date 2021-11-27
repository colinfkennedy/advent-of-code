require_relative 'seat_finder'

module TwentyTwenty
  class DayEleven
    attr_reader :seat_plan, :occupied_tollerance, :new_rules

    def initialize(input, occupied_tollerance: 4, new_rules: false)
      @seat_plan = input
      @occupied_tollerance = occupied_tollerance
      @new_rules = new_rules
      updated_seat_plan = []

      puts "Original Grid: #{seat_plan}"

      loops = 0

      loop do
        new_seats_occupied = 0
        new_seats_empty = 0
        loops += 1
        updated_seat_plan = seat_plan.map(&:dup)
        seat_plan.each_with_index do |row, row_index|
          row.each_with_index do |seat, column_index|
            case seat
            when '.'
              next
            when 'L'
              # Empty - walk other seats to see if they are occupied
              # If they are not, mark this seat as occupied
              if adjacent_unoccupied?(row_index, column_index, seat_plan)
                updated_seat_plan[row_index][column_index] = '#'
                new_seats_occupied += 1
              end
            when '#'
              # Occupied - walk other seats to see 4 or more are occupied
              # If they are, mark this seat as empty
              if adjacent_occupied?(row_index, column_index, seat_plan)
                updated_seat_plan[row_index][column_index] = 'L'
                new_seats_empty += 1
              end
            end
          end
        end
        @seat_plan = updated_seat_plan.clone.map(&:clone)

        break if new_seats_occupied + new_seats_empty == 0
      end
      puts "Loops: #{loops}"
    end

    def occupied_seats
      puts "Final seat plan: #{seat_plan}"
      seat_plan.flatten.count('#')
    end

    private def adjacent_unoccupied?(row_index, column_index, seat_plan)
      adjacent_seats = TwentyTwenty::SeatFinder.new(seat_plan: seat_plan, new_rules: new_rules).find_adjacent_seats(
        row_index, column_index
      )
      !adjacent_seats.include?('#')
    end

    private def adjacent_occupied?(row_index, column_index, seat_plan)
      adjacent_seats = TwentyTwenty::SeatFinder.new(seat_plan: seat_plan, new_rules: new_rules).find_adjacent_seats(
        row_index, column_index
      )
      adjacent_seats.count('#') >= 4
    end
  end
end
