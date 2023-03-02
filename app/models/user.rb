# frozen_string_literal: true

require 'digest/sha1'
class User < ApplicationRecord
  has_many :test_passages, dependent: :delete_all
  has_many :tests, through: :test_passages
  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id, dependent: :nullify

  validates :email, :username, presence: true

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test)
  end

  def authenticate(password_string)
    digest(password_string) == password_digest ? self : false
  end

  def user_tests(level)
    tests.where(level:)
  end

  private

  def digest(string)
    Digest::SHA1.hexdigest(string)
  end
end
