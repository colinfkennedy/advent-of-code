module TwentyTwentyOne
  class Board
    attr_reader :board_numbers
    attr_accessor :rows, :columns, :marked_numbers

    def initialize(board_numbers)
      @board_numbers = board_numbers
      @rows = board_numbers.dup
      @columns = board_numbers.transpose
      @marked_numbers = []
    end

    def mark_number(number)
      marked_numbers << number
      rows.each do |row|
        row.delete(number)
      end
      columns.each do |column|
        column.delete(number)
      end
    end

    def winner?
      rows.any?(&:empty?) || columns.any?(&:empty?)
    end

    def score
      rows.map(&:sum).sum * marked_numbers.last
    end

  end
end
