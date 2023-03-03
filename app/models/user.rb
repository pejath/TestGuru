# frozen_string_literal: true

require 'digest/sha1'
class User < ApplicationRecord
  has_many :test_passages, dependent: :delete_all
  has_many :tests, through: :test_passages
  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id, dependent: :nullify

  has_secure_password

  validates :username, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }, format: URI::MailTo::EMAIL_REGEXP

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test)
  end

  def user_tests(level)
    tests.where(level:)
  end
end
