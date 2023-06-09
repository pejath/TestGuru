# frozen_string_literal: true

module Rules
  class LevelRule
    def self.call(level, test_passage, user)
      return false if test_passage.test.level.to_s != level

      user_passes_count = successful_passes_for_level(level, user).count
      level_tests_count = Test.where(level:).count

      user_passes_count == level_tests_count
    end

    def self.successful_passes_for_level(level, user)
      tests = Test.where(level:).pluck(:id)
      user.successful_passes.where(test_id: tests).pluck(:test_id).uniq
    end
  end
end
