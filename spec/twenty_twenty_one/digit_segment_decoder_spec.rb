require 'twenty_twenty_one/digit_segment_decoder'

describe TwentyTwentyOne::DigitSegmentDecoder do
  context 'with test input' do
    it 'determines a' do
      input = 'acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab | cdfeb fcadb cdfeb cdbaf'

      expect(described_class.new(input).determine_a).to eq('d')
    end

    it 'determines c f' do
      input = 'acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab | cdfeb fcadb cdfeb cdbaf'

      expect(described_class.new(input).determine_c_f).to eq(%w[a b])
    end

    it 'determines b d' do
      input = 'acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab | cdfeb fcadb cdfeb cdbaf'

      expect(described_class.new(input).determine_b_d).to eq(%w[e f])
    end

    it 'determines e g' do
      input = 'acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab | cdfeb fcadb cdfeb cdbaf'

      expect(described_class.new(input).determine_e_g).to eq(%w[c g])
    end

    it 'responds true when testing a correct map' do
      input = 'acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab | cdfeb fcadb cdfeb cdbaf'
      map = {
        'a' => 'c',
        'b' => 'f',
        'c' => 'g',
        'd' => 'a',
        'e' => 'b',
        'f' => 'd',
        'g' => 'e'
      }

      expect(described_class.new(input).test_decoded_map(map)).to eq(true)
    end

    it 'decodes the digits and segments' do
      input = 'acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab | cdfeb fcadb cdfeb cdbaf'

      expect(described_class.new(input).create_decode_map).to eq(
        {
          'd' => 'a',
          'e' => 'b',
          'a' => 'c',
          'f' => 'd',
          'g' => 'e',
          'b' => 'f',
          'c' => 'g'
        }
      )
    end

    it 'gets 5353 for the output digits' do
      input = 'acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab | cdfeb fcadb cdfeb cdbaf'

      expect(described_class.new(input).decode_output_digits).to eq(5353)
    end

    it 'gets 8394 for the output digits' do
      input = 'be cfbegad cbdgef fgaecd cgeb fdcge agebfd fecdb fabcd edb | fdgacbe cefdb cefbgd gcbe'

      expect(described_class.new(input).decode_output_digits).to eq(8394)
    end

    it 'gets 9781 for the output digits' do
      input = 'edbfga begcd cbg gc gcadebf fbgde acbgfd abcde gfcbed gfec | fcgedb cgb dgebacf gc'

      expect(described_class.new(input).decode_output_digits).to eq(9781)
    end

    it 'gets 1197 for the output digits' do
      input = 'fgaebd cg bdaec gdafb agbcfd gdcbef bgcad gfac gcb cdgabef | cg cg fdcagb cbg'

      expect(described_class.new(input).decode_output_digits).to eq(1197)
    end

    it 'gets 9361 for the output digits' do
      input = 'fbegcd cbd adcefb dageb afcb bc aefdc ecdab fgdeca fcdbega | efabcd cedba gadfec cb'

      expect(described_class.new(input).decode_output_digits).to eq(9361)
    end

    it 'gets 4873 for the output digits' do
      input = 'aecbfdg fbg gf bafeg dbefa fcge gcbea fcaegb dgceab fcbdga | gecf egdcabf bgf bfgea'

      expect(described_class.new(input).decode_output_digits).to eq(4873)
    end

    it 'gets 8418 for the output digits' do
      input = 'fgeab ca afcebg bdacfeg cfaedg gcfdb baec bfadeg bafgc acf | gebdcfa ecba ca fadegcb'

      expect(described_class.new(input).decode_output_digits).to eq(8418)
    end

    it 'gets 4548 for the output digits' do
      input = 'dbcfg fgd bdegcaf fgec aegbdf ecdfab fbedc dacgb gdcebf gf | cefg dcbef fcge gbcadfe'

      expect(described_class.new(input).decode_output_digits).to eq(4548)
    end

    it 'gets 1625 for the output digits' do
      input = 'bdfegc cbegaf gecbf dfcage bdacg ed bedf ced adcbefg gebcd | ed bcgafe cdgba cbgef'

      expect(described_class.new(input).decode_output_digits).to eq(1625)
    end

    it 'gets 8717 for the output digits' do
      input = 'egadfb cdbfeg cegd fecab cgb gbdefca cg fgcdab egfdb bfceg | gbdfcae bgc cg cgb'

      expect(described_class.new(input).decode_output_digits).to eq(8717)
    end

    it 'gets 4315 for the output digits' do
      input = 'gcafb gcf dcaebfg ecagb gf abcdeg gaef cafbge fdbac fegbdc | fgae cfgab fg bagce'

      expect(described_class.new(input).decode_output_digits).to eq(4315)
    end
  end
end
