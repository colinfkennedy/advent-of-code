module TwentyTwenty
  class DaySix
    def self.count_affirmative_questions(input)
      affirmative_answers = {}
      count_answers = 0
      input.each do |person_questions|
        person_questions = person_questions.strip
        if person_questions.empty?
          count_answers += affirmative_answers.size
          affirmative_answers = {}
        else
          person_questions.each_char { |answer| affirmative_answers[answer] = true }
        end
      end
      count_answers + affirmative_answers.size
    end

    def self.count_everyone_affirmative_questions(input)
      affirmative_answers = {}
      count_answers = 0
      group_size = 0
      input.each do |person_questions|
        person_questions = person_questions.strip
        if person_questions.empty?
          count_answers += count_whole_group_answered(affirmative_answers, group_size)
          affirmative_answers = {}
          group_size = 0
        else
          person_questions.each_char do |answer|
            if affirmative_answers[answer].nil?
              affirmative_answers[answer] = 1
            else
              affirmative_answers[answer] += 1
            end
          end
          group_size += 1
        end
      end
      count_answers + count_whole_group_answered(affirmative_answers, group_size)
    end

    def self.count_whole_group_answered(affirmative_answers, group_size)
      count = 0
      affirmative_answers.values.each do |number_answered|
        count += 1 if number_answered == group_size
      end
      count
    end
  end
end
