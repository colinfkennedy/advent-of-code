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

  end
end
