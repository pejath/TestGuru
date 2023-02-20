# frozen_string_literal: true

class User < ApplicationRecord
  def user_tests(level)
    Test.joins('join results on results.test_id = tests.id')
        .where(results: { user_id: id }, level: level)
  end
end
