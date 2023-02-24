# frozen_string_literal: true

class User < ApplicationRecord
  has_many :results, dependent: :delete_all
  has_many :tests, through: :results
  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id, dependent: :nullify

  validates :email, :username, presence: true

  def user_tests(level)
    tests.where(level:)
  end
end
