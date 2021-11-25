require 'twenty_twenty/day_ten'

describe TwentyTwenty::DayTen do
  context 'with test input' do
    it 'gets 7 one volts and 5 three volts' do
      input = [16,
               10,
               15,
               5,
               1,
               11,
               7,
               19,
               6,
               12,
               4]
      adapter_map = described_class.new(input)
      expect(adapter_map.one_volt_count).to eq(7)
      expect(adapter_map.three_volt_count).to eq(5)
    end
  end

  context 'with test input 2' do
    it 'gets 7 one volts and 5 three volts' do
      input = [28,
               33,
               18,
               42,
               31,
               14,
               46,
               20,
               48,
               47,
               24,
               23,
               49,
               45,
               19,
               38,
               39,
               11,
               1,
               32,
               25,
               35,
               8,
               17,
               7,
               9,
               4,
               2,
               34,
               10,
               3]
      adapter_map = described_class.new(input)
      expect(adapter_map.one_volt_count).to eq(22)
      expect(adapter_map.three_volt_count).to eq(10)
    end
  end
end
