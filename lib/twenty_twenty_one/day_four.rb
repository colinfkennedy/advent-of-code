require_relative 'board'

module TwentyTwentyOne
  class DayFour
    attr_reader :numbers_to_mark, :boards

    def initialize(input)
      @input = input
      @numbers_to_mark = input.first.split(',').map(&:to_i)
      puts "Numbers to mark: #{numbers_to_mark}"
      @boards = []
      board_rows = []
      input.drop(1).each do |line|
        if line.empty?
          boards.push(TwentyTwentyOne::Board.new(board_rows)) unless board_rows.empty?
          board_rows = []
        else
          board_rows.push(line.split(' ').map(&:to_i))
        end
      end
      boards.push(TwentyTwentyOne::Board.new(board_rows)) unless board_rows.empty?

      puts "Boards count: #{boards.size}"
    end

    def winning_score
      numbers_to_mark.each do |number|
        boards.each do |board|
          board.mark_number(number)
        end
        break if boards.any?(&:winner?)
      end
      boards.find(&:winner?).score
    end

    def last_winning_score
      working_boards = boards.dup
      numbers_to_mark.each do |number|
        working_boards.each do |board|
          board.mark_number(number)
        end
        working_boards = working_boards.reject(&:winner?) if working_boards.size > 1
        break if working_boards.any?(&:winner?) && working_boards.size == 1
      end
      working_boards.find(&:winner?).score
    end
  end
end
