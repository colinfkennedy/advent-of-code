module TwentyTwenty
  class DayOne
    def self.product_2_sum_2020(input)
      product_map = {}
      input.each do |number|
        product_map[2020 - number] = number
      end

      input.each do |number|
        unless product_map[number].nil?
          return product_map[number] * number
        end
      end
    end

    def self.product_3_sum_2020(input)
      input.each do |number_1|
        input.each do |number_2|
          input.each do |number_3|
            if number_1 + number_2 + number_3 == 2020
              return number_1 * number_2 * number_3
            end
          end
        end
      end
    end

  end
end
