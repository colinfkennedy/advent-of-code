module TwentyTwenty
  class BoardingPass
    ROWS = 0..127
    COLUMNS = 0..7

    attr_reader :row, :column

    def initialize(encoded_seat)
      row_identifiers = encoded_seat[0, 7]
      column_identifiers = encoded_seat[7, 3]

      row_array = ROWS.to_a
      row_identifiers.each_char do |row_identifier|
        front, back = row_array.each_slice((row_array.size / 2.0).round).to_a
        row_array = row_identifier == 'F' ? front : back
      end
      @row = row_array[0]

      column_array = COLUMNS.to_a
      column_identifiers.each_char do |column_identifier|
        left, right = column_array.each_slice((column_array.size / 2.0).round).to_a
        column_array = column_identifier == 'L' ? left : right
      end
      @column = column_array[0]
    end

    def seat_id
      row * 8 + column
    end
  end
end
