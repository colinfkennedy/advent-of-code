require 'twenty_twenty/day_nine'

describe TwentyTwenty::DayNine do
  context 'with test input and preamble length of 5' do
    it 'gets 127 as the first invalid number' do
      input = [35,
               20,
               15,
               25,
               47,
               40,
               62,
               55,
               65,
               95,
               102,
               117,
               150,
               182,
               127,
               219,
               299,
               277,
               309,
               576]
      expect(described_class.find_first_invalid(input, 5)).to eq(127)
    end

    it 'gets 62 for smallest and largest range adding to 127' do
      input = [35,
               20,
               15,
               25,
               47,
               40,
               62,
               55,
               65,
               95,
               102,
               117,
               150,
               182,
               127,
               219,
               299,
               277,
               309,
               576]
      expect(described_class.find_weakness(input, 127)).to eq(62)
    end
  end
end
