require_relative 'boarding_pass'

module TwentyTwenty
  class DayFive
    def self.highest_seat_id(input)
      seat_ids = input.map { |encoded_seat| BoardingPass.new(encoded_seat).seat_id }
      seat_ids.max
    end

    def self.my_seat_id(input)
      seat_ids = input.map { |encoded_seat| BoardingPass.new(encoded_seat).seat_id }
      sorted_seat_ids = seat_ids.sort
      sorted_seat_ids.each_with_index do |seat_id, index|
        return seat_id + 1 if sorted_seat_ids[index + 1] == seat_id + 2
      end
    end
  end
end
