module TwentyTwenty
  class DayTen
    attr_reader :one_volt_count, :three_volt_count

    def initialize(input)
      input = input.map(&:to_i)
      voltage_map = {}
      input.each { |adapter_voltage| voltage_map[adapter_voltage] = adapter_voltage }
      device_voltage = input.max + 3
      reference_voltage = 0
      @one_volt_count = 0
      @three_volt_count = 1
      depth_first_search(reference_voltage, device_voltage, voltage_map, [], input.size)

      puts "Final adapters: #{@adapters}"

      previous_voltage = 0
      @adapters.each do |voltage|
        case voltage - previous_voltage
        when 1
          @one_volt_count += 1
        when 3
          @three_volt_count += 1
        end
        previous_voltage = voltage
      end
    end

    def depth_first_search(reference_voltage, target, voltage_map, adapters, total_adapters_count)
      adapters.push(reference_voltage)
      if (reference_voltage + 3) == target && ((total_adapters_count + 1) == adapters.size)
        puts "total adapters count: #{total_adapters_count}"
        puts "adapters count: #{adapters.size}"
        puts "yes #{adapters}"
        @adapters = adapters.clone
        return
      end
      if voltage_map[reference_voltage + 1]
        depth_first_search(reference_voltage + 1, target, voltage_map, adapters,
                           total_adapters_count)
      end
      if voltage_map[reference_voltage + 3]
        depth_first_search(reference_voltage + 3, target, voltage_map, adapters,
                           total_adapters_count)
      end
    end
  end
end
