require_relative 'seat_finder'

module TwentyTwenty
  class DayEleven
    attr_reader :original_grid, :final_grid, :columns, :rows

    def initialize(input)
      @original_grid = input
      @final_grid = []

      puts "Original Grid: #{original_grid}"

      @columns = original_grid[0].length
      @rows = original_grid.length

      loops = 0

      loop do
        new_seats_occupied = 0
        new_seats_empty = 0
        loops += 1
        final_grid = original_grid.map(&:dup)
        original_grid.each_with_index do |row, row_index|
          row.each_with_index do |seat, column_index|
            case seat
            when '.'
              next
            when 'L'
              # Empty - walk other seats to see if they are occupied
              # If they are not, mark this seat as occupied
              if adjacent_unoccupied?(row_index, column_index, original_grid)
                final_grid[row_index][column_index] = '#'
                new_seats_occupied += 1
              end
            when '#'
              # Occupied - walk other seats to see 4 or more are occupied
              # If they are, mark this seat as empty
              if adjacent_four_occupied?(row_index, column_index, original_grid)
                final_grid[row_index][column_index] = 'L'
                new_seats_empty += 1
              end
            end
          end
        end
        @original_grid = final_grid.clone.map(&:clone)

        break if new_seats_occupied + new_seats_empty == 0
      end
      puts "Loops: #{loops}"
    end

    def occupied_seats
      puts "Original Grid: #{original_grid}"
      puts "Final Grid: #{final_grid}"
      original_grid.flatten.count('#')
    end

    private def adjacent_unoccupied?(row_index, column_index, grid)
      adjacent_seats = TwentyTwenty::SeatFinder.new(grid).find_adjacent_seats(row_index, column_index)
      !adjacent_seats.include?('#')
    end

    private def adjacent_four_occupied?(row_index, column_index, grid)
      adjacent_seats = TwentyTwenty::SeatFinder.new(grid).find_adjacent_seats(row_index, column_index)
      adjacent_seats.count('#') >= 4
    end
  end
end
