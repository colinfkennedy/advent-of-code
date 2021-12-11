module TwentyTwentyOne
  class DayEleven
    attr_reader :input, :octopus_map

    def initialize(input)
      @input = input
      @octopus_map = input.map { |line| line.split('').map(&:to_i) }
      octopus_map.each_with_index do |row, y|
        row.each_with_index do |octopus_energy, x|
          octopus_map[y][x] = Octopus.new(x, y, octopus_energy, octopus_map)
        end
      end
    end

    def flash_count(steps)
      flash_count = 0
      (1..steps).each do |step|
        octopus_map.each do |row|
          row.each do |octopus|
            flash_count += octopus.flash_count(step)
          end
        end
      end
      flash_count
    end

    def simultaneous_flash_step
      step = 0
      until synchronised?
        step += 1
        octopus_map.each do |row|
          row.each do |octopus|
            octopus.flash_count(step)
          end
        end
      end
      step
    end

    def synchronised?
      octopus_map.flatten.all? { |octopus| octopus.energy.zero? }
    end
  end

  class Octopus
    attr_accessor :energy
    attr_reader :x, :y, :octopus_map, :flashed_steps

    def initialize(x, y, energy, octopus_map)
      @x = x
      @y = y
      @energy = energy
      @octopus_map = octopus_map
      @flashed_steps = []
    end

    def neighbours
      neighbours = []
      neighbours << octopus_map[y - 1][x] if y.positive? # up
      neighbours << octopus_map[y + 1][x] if y < octopus_map.size - 1 # down
      neighbours << octopus_map[y][x - 1] if x.positive? # left
      neighbours << octopus_map[y][x + 1] if x < octopus_map[y].size - 1 # right
      neighbours << octopus_map[y - 1][x - 1] if y.positive? && x.positive? # up left
      neighbours << octopus_map[y - 1][x + 1] if y.positive? && x < octopus_map[y].size - 1 # up right
      neighbours << octopus_map[y + 1][x - 1] if y < octopus_map.size - 1 && x.positive? # down left
      neighbours << octopus_map[y + 1][x + 1] if y < octopus_map.size - 1 && x < octopus_map[y].size - 1 # down right
      neighbours
    end

    def flashed_this_step?(step)
      flashed_steps.include?(step)
    end

    def flash_count(step)
      return 0 if flashed_this_step?(step)

      if energy == 9
        @energy = 0
        flashed_steps << step
        neighbour_flash_count = 0
        neighbours.each do |neighbour|
          neighbour_flash_count += neighbour.flash_count(step)
        end
        1 + neighbour_flash_count
      else
        @energy += 1
        0
      end
    end

    def ==(other)
      other.class == self.class && other.x == x && other.y == y
    end
  end
end
