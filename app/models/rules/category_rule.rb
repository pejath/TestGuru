# frozen_string_literal: true

module Rules
  class CategoryRule
    def self.call(category_id, test_passage, user)
      return false if test_passage.test.category_id.to_s != category_id

      tests = Test.where(category_id:).pluck(:id)
      user_passes = user.successful_passes.where(test: tests).pluck(:test_id).uniq

      tests.count == user_passes.count
    end
  end
end
