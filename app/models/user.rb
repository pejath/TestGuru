# frozen_string_literal: true

class User < ApplicationRecord
  has_many :test_passages, dependent: :delete_all
  has_many :tests, through: :test_passages
  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id, dependent: :nullify

  validates :username, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }, format: URI::MailTo::EMAIL_REGEXP

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable, :confirmable

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test)
  end

  def user_tests(level)
    tests.where(level:)
  end

  def admin?
    is_a?(Admin)
  end

  def full_name
    if first_name.empty? && last_name.empty?
      username
    else
      "#{first_name} #{last_name}"
    end
  end
end
