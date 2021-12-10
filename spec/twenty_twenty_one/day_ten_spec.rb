require 'twenty_twenty_one/day_ten'

describe TwentyTwentyOne::DayTen do
  context 'with test input' do
    it 'gets the answer 26397 for syntax error score' do
      input = [
        '[({(<(())[]>[[{[]{<()<>>',
        '[(()[<>])]({[<{<<[]>>(',
        '{([(<{}[<>[]}>{[]{[(<()>',
        '(((({<>}<{<{<>}{[]{[]{}',
        '[[<[([]))<([[{}[[()]]]',
        '[{[{({}]{}}([{[{{{}}([]',
        '{<[[]]>}<{[{[{[]{()[[[]',
        '[<(<(<(<{}))><([]([]()',
        '<{([([[(<>()){}]>(<<{{',
        '<{([{{}}[<[[[<>{}]]]>[]]'
      ]
      expect(described_class.new(input).syntax_error_score).to eq(26_397)
    end

    # context 'completion string score' do
    #   it 'gets 288957 for completion string score' do
    #     input = '[({(<(())[]>[[{[]{<()<>>'
    #     expect(described_class.new(input).completion_string_score(input)).to eq(288_957)
    #   end

    #   it 'gets 5566 for completion string score' do
    #     input = '[(()[<>])]({[<{<<[]>>('
    #     expect(described_class.new(input).completion_string_score(input)).to eq(5566)
    #   end

    #   it 'gets 1480781 for completion string score' do
    #     input = '(((({<>}<{<{<>}{[]{[]{}'
    #     expect(described_class.new(input).completion_string_score(input)).to eq(1_480_781)
    #   end

    #   it 'gets 995444 for completion string score' do
    #     input = '{<[[]]>}<{[{[{[]{()[[[]'
    #     expect(described_class.new(input).completion_string_score(input)).to eq(995_444)
    #   end

    #   it 'gets 294 for completion string score' do
    #     input = '<{([{{}}[<[[[<>{}]]]>[]]'
    #     expect(described_class.new(input).completion_string_score(input)).to eq(294)
    #   end
    # end

    it 'gets the answer 288957 for autocomplete score' do
      input = [
        '[({(<(())[]>[[{[]{<()<>>',
        '[(()[<>])]({[<{<<[]>>(',
        '{([(<{}[<>[]}>{[]{[(<()>',
        '(((({<>}<{<{<>}{[]{[]{}',
        '[[<[([]))<([[{}[[()]]]',
        '[{[{({}]{}}([{[{{{}}([]',
        '{<[[]]>}<{[{[{[]{()[[[]',
        '[<(<(<(<{}))><([]([]()',
        '<{([([[(<>()){}]>(<<{{',
        '<{([{{}}[<[[[<>{}]]]>[]]'
      ]
      expect(described_class.new(input).autocomplete_score).to eq(288_957)
    end
  end
end
