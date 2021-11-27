module TwentyTwenty
  class SeatFinder
    attr_reader :seat_map, :rows, :columns

    def initialize(seat_map)
      @seat_map = seat_map
      @rows = seat_map.length
      @columns = seat_map[0].length
    end

    def find_adjacent_seats(row_index, column_index)
      adjacent_seats = []

      adjacent_seats.push(seat_map[row_index][column_index + 1]) if column_index + 1 < columns
      adjacent_seats.push(seat_map[row_index][column_index - 1]) if column_index - 1 >= 0
      adjacent_seats.push(seat_map[row_index - 1][column_index + 1]) if row_index - 1 >= 0 && column_index + 1 < columns
      adjacent_seats.push(seat_map[row_index - 1][column_index - 1]) if row_index - 1 >= 0 && column_index - 1 >= 0
      adjacent_seats.push(seat_map[row_index - 1][column_index]) if row_index - 1 >= 0
      if row_index + 1 < rows && column_index + 1 < columns
        adjacent_seats.push(seat_map[row_index + 1][column_index + 1])
      end
      adjacent_seats.push(seat_map[row_index + 1][column_index - 1]) if row_index + 1 < rows && column_index - 1 >= 0
      adjacent_seats.push(seat_map[row_index + 1][column_index]) if row_index + 1 < rows

      adjacent_seats
    end
  end
end
