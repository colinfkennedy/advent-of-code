module TwentyTwenty
  class DayEleven
    attr_reader :original_grid, :final_grid

    def initialize(input)
      @original_grid = []
      @final_grid = []
      input.split("\n").map do |line|
        line_array = line.split('')
        original_grid.push(line_array)
        final_grid.push(line_array)
      end
      original_grid.each_with_index do |row, column_index|
        row.each_with_index do |seat, row_index|
          case seat
          when '.'
            break
          when 'L'
            # Empty - walk other seats to see if they are occupied
            # If they are not, mark this seat as occupied
            final_grid[column_index][row_index] = adjacent_occupied?(column_index, row_index, original_grid) ? 'L' : '#'
          when '#'
            # Occupied - walk other seats to see 4 or more are occupied
            # If they are, mark this seat as empty
            final_grid[column_index][row_index] =
              adjacent_four_occupied?(column_index, row_index, original_grid) ? 'L' : '#'
          end
        end
      end
    end

    def unoccupied_seats
      puts "Original Grid: #{original_grid}"
      puts "Final Grid: #{final_grid}"
    end

    private def adjacent_occupied?(column_index, row_index, original_grid)
      #TODO - Need to handle out of bounds cases
      original_grid[column_index][row_index + 1] == '#' ||
      original_grid[column_index][row_index - 1] == '#' ||
      original_grid[column_index - 1][row_index + 1] == '#' ||
      original_grid[column_index - 1][row_index - 1] == '#' ||
      original_grid[column_index - 1][row_index] == '#' ||
      original_grid[column_index + 1][row_index + 1] == '#' ||
      original_grid[column_index + 1][row_index - 1] == '#' ||
      original_grid[column_index + 1][row_index] == '#'
    end

    private def adjacent_four_occupied?(column_index, row_index, original_grid)
      count = 0
      count += 1 if original_grid[column_index][row_index + 1] == '#'
      count += 1 if original_grid[column_index][row_index - 1] == '#'
      count += 1 if original_grid[column_index - 1][row_index + 1] == '#'
      count += 1 if original_grid[column_index - 1][row_index - 1] == '#'
      count += 1 if original_grid[column_index - 1][row_index] == '#'
      count += 1 if original_grid[column_index + 1][row_index + 1] == '#'
      count += 1 if original_grid[column_index + 1][row_index - 1] == '#'
      count += 1 if original_grid[column_index + 1][row_index] == '#'
      count > 3
    end
  end
end
