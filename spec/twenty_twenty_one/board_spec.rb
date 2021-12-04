require 'twenty_twenty_one/board'

describe TwentyTwentyOne::Board do
  context 'with 2x2 board' do
    it 'it responds false to winner? when no numbers marked off' do
      board_numbers = [
        [1, 2],
        [3, 4]
      ]

      board = described_class.new(board_numbers)

      expect(board.winner?).to eq(false)
    end

    it 'it responds false to winner? when one number marked off' do
      board_numbers = [
        [1, 2],
        [3, 4]
      ]

      board = described_class.new(board_numbers)
      board.mark_number(1)

      expect(board.winner?).to eq(false)
    end

    it 'it responds false to winner? when diagonal numbers marked off' do
      board_numbers = [
        [1, 2],
        [3, 4]
      ]

      board = described_class.new(board_numbers)
      board.mark_number(2)
      board.mark_number(3)

      expect(board.winner?).to eq(false)
    end

    it 'it responds true to winner? when one row of numbers marked off' do
      board_numbers = [
        [1, 2],
        [3, 4]
      ]

      board = described_class.new(board_numbers)
      board.mark_number(1)
      board.mark_number(2)

      expect(board.winner?).to eq(true)
    end

    it 'it responds true to winner? when one column of numbers marked off' do
      board_numbers = [
        [1, 2],
        [3, 4]
      ]

      board = described_class.new(board_numbers)
      board.mark_number(2)
      board.mark_number(4)

      expect(board.winner?).to eq(true)
    end
  end

  context 'with 5x5 winning board' do
    it 'returns the board score' do
      board_numbers = [
        [1, 2, 3, 4, 5],
        [6, 7, 8, 9, 10],
        [11, 12, 13, 14, 15],
        [16, 17, 18, 19, 20],
        [21, 22, 23, 24, 25]
      ]

      board = described_class.new(board_numbers)
      board.mark_number(1)
      board.mark_number(2)
      board.mark_number(3)
      board.mark_number(4)
      board.mark_number(5)

      expect(board.score).to eq(1550)
    end
  end
end
