# frozen_string_literal: true

class Gist < ApplicationRecord
  belongs_to :question
  belongs_to :user, optional: true

  validates :url, presence: true
end
