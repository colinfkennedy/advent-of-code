module TwentyTwentyOne
  class DayTwelve
    attr_reader :input, :caves

    def initialize(input)
      @input = input
      @caves = {}
      input.each do |line|
        cave_1, cave_2 = line.split('-')

        caves[cave_1] = Cave.new(cave_1) if caves[cave_1].nil?
        caves[cave_2] = Cave.new(cave_2) if caves[cave_2].nil?

        caves[cave_1].add_connection(caves[cave_2])
        caves[cave_2].add_connection(caves[cave_1])
      end
    end

    def paths(allow_double_visit: false)
      caves.each do |_, cave|
        puts "Cave: #{cave.name} connections: #{cave.connecting_caves.map(&:name)}"
      end
      start_cave = caves['start']
      paths = []
      find_paths(start_cave, Path.new, paths, allow_double_visit)

      # puts "Paths: #{paths}"
      paths.size
    end

    def find_paths(cave, path, paths, allow_double_visit)
      return if cave.already_visited?(path, allow_double_visit)

      path.add_cave(cave.name)

      if cave.end?
        paths << path
      else
        cave.connecting_caves.each do |c|
          find_paths(c, Path.new(path), paths, allow_double_visit)
        end
      end
    end
  end

  class Cave
    attr_reader :name, :connecting_caves

    def initialize(name)
      @name = name
      @connecting_caves = []
    end

    def start?
      name == 'start'
    end

    def end?
      name == 'end'
    end

    def small_cave?
      name == name.downcase
    end

    def add_connection(cave)
      return if connecting_caves.include?(cave)

      connecting_caves << cave
    end

    def already_visited?(path, allow_double_visit)
      if small_cave? && allow_double_visit && !path.has_double_visit && !start? && !end?
        number_of_visits = path.path.count(name)
        if number_of_visits < 2
          path.has_double_visit = true if number_of_visits == 1
          false
        else
          true
        end
      else
        small_cave? && path.path.include?(name)
      end
    end

    def ==(other)
      name == other.name
    end

    def to_s
      name
    end
  end

  class Path
    attr_accessor :has_double_visit
    attr_reader :path

    def initialize(initial_path = nil)
      @path = initial_path ? initial_path.path.dup : []
      @has_double_visit = initial_path ? initial_path.has_double_visit : false
    end

    def add_cave(cave)
      path << cave
    end

    def to_s
      path.join(',')
    end
  end
end
