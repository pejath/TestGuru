# frozen_string_literal: true

class Contact < ApplicationRecord
  validates :email, :name, :body, presence: true
  validates :email, format: URI::MailTo::EMAIL_REGEXP
end
