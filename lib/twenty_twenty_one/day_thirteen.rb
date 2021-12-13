module TwentyTwentyOne
  class DayThirteen
    attr_reader :input, :grid, :fold_instructions

    def initialize(input)
      @input = input
      coordinates = []
      @fold_instructions = []

      input.each do |line|
        if line.start_with?('fold along')
          fold_instructions << line.delete('fold along ').split('=')
        else
          coordinates << line.split(',').map(&:to_i) unless line.empty?
        end
      end

      max_x = coordinates.map { |x, _y| x }.max
      max_y = coordinates.map { |_x, y| y }.max

      @grid = Array.new(max_y + 1) { Array.new(max_x + 1) { '.' } }
      coordinates.each do |x, y|
        @grid[y][x] = '#'
      end
      # draw_grid
    end

    def visible_dots
      x_or_y, index = fold_instructions.first
      if x_or_y == 'x'
        fold_along_x(index.to_i)
      else
        fold_along_y(index.to_i)
      end

      grid.flatten.count('#')
    end

    def draw_after_all_folds
      fold_instructions.each do |instruction|
        x_or_y, index = instruction
        if x_or_y == 'x'
          fold_along_x(index.to_i)
        else
          fold_along_y(index.to_i)
        end
        # draw_grid(instruction)
      end

      draw_grid
    end

    def fold_along_x(index)
      left_part = @grid.map { |row| row.slice(0, index) }
      right_part = @grid.map { |row| row.slice(index + 1, row.size - index).reverse }
      # @grid = combine_grids(left_part, right_part)
      new_grid = []
      left_part.each_with_index do |row, i|
        new_row = []
        if row.size > right_part[i].size
          (row.size - right_part[i].size).times { right_part[i].prepend('.') }
        elsif right_part[i].size > row.size
          (right_part[i].size - row.size).times { row.prepend('.') }
        end

        row.zip(right_part[i]) do |x, y|
          new_row << if x == '#' || y == '#'
                       '#'
                     else
                       '.'
                     end
        end

        new_grid << new_row
      end

      @grid = new_grid
    end

    def fold_along_y(index)
      top_part = @grid.slice(0, index)
      bottom_part = @grid.slice(index + 1, @grid.size).reverse
      # @grid = combine_grids(top_part, bottom_part)
      new_grid = []
      if top_part.size > bottom_part.size
        (top_part.size - bottom_part.size).times { bottom_part.prepend(Array.new(top_part.first.size, '.')) }
      elsif bottom_part.size > top_part.size
        (bottom_part.size - top_part.size).times { top_part.prepend(Array.new(bottom_part.first.size, '.')) }
      end

      top_part.each_with_index do |row, i|
        new_row = []

        row.zip(bottom_part[i]) do |x, y|
          new_row << if x == '#' || y == '#'
                       '#'
                     else
                       '.'
                     end
        end

        new_grid << new_row
      end

      @grid = new_grid
    end

    def combine_grids(grid_one, grid_two)
      new_grid = []
      grid_one.each_with_index do |row, i|
        new_row = []
        if grid_two[i].nil?
          new_row = row
        else
          row.zip(grid_two[i]) do |x, y|
            new_row << if x == '#' || y == '#'
                         '#'
                       else
                         '.'
                       end
          end
        end

        new_grid << new_row
      end
      if grid_two.size > grid_one.size
        grid_two.slice(grid_one.size, grid_two.size).each do |row|
          new_grid << row
        end
      end
      new_grid
    end

    def draw_grid(instruction = nil)
      puts "Grid #{instruction}"
      puts grid.map(&:join).join("\n")
    end
  end
end
