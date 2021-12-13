require 'twenty_twenty_one/day_thirteen'

describe TwentyTwentyOne::DayThirteen do
  context 'with test input' do
    it 'gets the answer 17 for visible dots' do
      input = [
        '6,10',
        '0,14',
        '9,10',
        '0,3',
        '10,4',
        '4,11',
        '6,0',
        '6,12',
        '4,1',
        '0,13',
        '10,12',
        '3,4',
        '3,0',
        '8,4',
        '1,10',
        '2,14',
        '8,10',
        '9,0',
        '',
        'fold along y=7',
        'fold along x=5'
      ]
      expect(described_class.new(input).visible_dots).to eq(17)
    end
  end
  context 'with uneven folds' do
    it 'gets the answer 1 for visible dots on a y fold top bigger' do
      # .
      # X
      # -
      # X
      input = [
        '0,1',
        '0,3',
        '',
        'fold along y=2'
      ]
      expect(described_class.new(input).visible_dots).to eq(1)
    end

    it 'gets the answer 6 for visible dots on a y fold top bigger' do
      # ..X..
      # .X.X.
      # X...X
      # -----
      # X.X.X
      input = [
        '2,0',
        '1,1',
        '3,1',
        '0,2',
        '4,2',
        '0,4',
        '2,4',
        '4,4',
        '',
        'fold along y=3'
      ]
      expect(described_class.new(input).visible_dots).to eq(6)
    end

    it 'gets the answer 2 for visible dots on a y fold bottom bigger' do
      # X.
      # --
      # X.
      # .X
      input = [
        '0,0',
        '0,2',
        '1,3',
        '',
        'fold along y=1'
      ]
      expect(described_class.new(input).visible_dots).to eq(2)
    end

    it 'gets the answer 7 for visible dots on a y fold bottom bigger' do
      # X...X
      # -----
      # X...X
      # .X..X
      # X.X.X
      input = [
        '0,0',
        '4,0',
        '0,2',
        '4,2',
        '1,3',
        '4,3',
        '0,4',
        '2,4',
        '4,4',
        '',
        'fold along y=1'
      ]
      expect(described_class.new(input).visible_dots).to eq(7)
    end

    it 'gets the answer 1 for visible dots on an x fold left bigger' do
      # .X|X
      input = [
        '1,0',
        '3,0',
        '',
        'fold along x=2'
      ]
      expect(described_class.new(input).visible_dots).to eq(1)
    end

    it 'gets the answer 6 for visible dots on an x fold left bigger' do
      # ..X|X
      # XX.|X
      # X..|X
      input = [
        '2,0',
        '4,0',
        '0,1',
        '1,1',
        '4,1',
        '0,2',
        '4,2',
        '',
        'fold along x=3'
      ]
      expect(described_class.new(input).visible_dots).to eq(6)
    end

    it 'gets the answer 1 for visible dots on an x fold right bigger' do
      # X|X.
      input = [
        '0,0',
        '2,0',
        '',
        'fold along x=1'
      ]
      expect(described_class.new(input).visible_dots).to eq(1)
    end

    it 'gets the answer 8 for visible dots on an x fold left bigger' do
      # X|XXX
      # X|..X
      # X|XXX
      input = [
        '0,0',
        '2,0',
        '3,0',
        '4,0',
        '0,1',
        '4,1',
        '0,2',
        '2,2',
        '3,2',
        '4,2',
        '',
        'fold along x=1'
      ]
      expect(described_class.new(input).visible_dots).to eq(8)
    end
  end
end
