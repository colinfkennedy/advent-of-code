module TwentyTwenty
  class DayTwo

    POLICY_PASSWORD_REGEXP = /([0-9]+)-([0-9]+) ([a-z]): ([a-z]+)/

    def self.number_correct_passwords_range(input)
      correct_passwords = []
      input.each do |policy_password|
        puts "policy_password: #{policy_password}"
        min, max, letter, password = match_policy_password(policy_password)
        occurrences = password.count(letter)
        correct_passwords.push(password) if min <= occurrences && occurrences <= max
      end
      correct_passwords.size
    end

    def self.number_correct_passwords_position(input)
      correct_passwords = []
      input.each do |policy_password|
        puts "policy_password: #{policy_password}"
        position_1, position_2, letter, password = match_policy_password(policy_password)
        position_1_valid = password[position_1 - 1] == letter
        position_2_valid = password[position_2 - 1] == letter
        if position_1_valid ^ position_2_valid
          correct_passwords.push(password)
        end
      end
      correct_passwords.size
    end

    private_class_method def self.match_policy_password(policy_password)
      matched = policy_password.match(POLICY_PASSWORD_REGEXP)
      min = matched[1].to_i
      max = matched[2].to_i
      letter = matched[3]
      password = matched[4]
      [min, max, letter, password]
    end

  end
end

