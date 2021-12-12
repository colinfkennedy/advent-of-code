require 'twenty_twenty_one/day_twelve'

describe TwentyTwentyOne::DayTwelve do
  context 'with test input' do
    context 'smallest input' do
      it 'gets the answer 10 for paths' do
        input = %w[
          start-A
          start-b
          A-c
          A-b
          b-d
          A-end
          b-end
        ]
        expect(described_class.new(input).paths).to eq(10)
      end

      it 'gets the answer 36 for double paths' do
        input = %w[
          start-A
          start-b
          A-c
          A-b
          b-d
          A-end
          b-end
        ]
        expect(described_class.new(input).paths(allow_double_visit: true)).to eq(36)
      end
    end

    context 'with slightly larger input' do
      it 'gets the answer 19 for paths' do
        input = %w[
          dc-end
          HN-start
          start-kj
          dc-start
          dc-HN
          LN-dc
          HN-end
          kj-sa
          kj-HN
          kj-dc
        ]
        expect(described_class.new(input).paths).to eq(19)
      end

      it 'gets the answer 103 for double paths' do
        input = %w[
          dc-end
          HN-start
          start-kj
          dc-start
          dc-HN
          LN-dc
          HN-end
          kj-sa
          kj-HN
          kj-dc
        ]
        expect(described_class.new(input).paths(allow_double_visit: true)).to eq(103)
      end
    end

    context 'with even larger input' do
      it 'gets the answer 226 for paths' do
        input = %w[
          fs-end
          he-DX
          fs-he
          start-DX
          pj-DX
          end-zg
          zg-sl
          zg-pj
          pj-he
          RW-he
          fs-DX
          pj-RW
          zg-RW
          start-pj
          he-WI
          zg-he
          pj-fs
          start-RW
        ]
        expect(described_class.new(input).paths).to eq(226)
      end

      it 'gets the answer 3509 for double paths' do
        input = %w[
          fs-end
          he-DX
          fs-he
          start-DX
          pj-DX
          end-zg
          zg-sl
          zg-pj
          pj-he
          RW-he
          fs-DX
          pj-RW
          zg-RW
          start-pj
          he-WI
          zg-he
          pj-fs
          start-RW
        ]
        expect(described_class.new(input).paths(allow_double_visit: true)).to eq(3509)
      end
    end
  end
end
