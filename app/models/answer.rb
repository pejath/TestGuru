# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  validate :max_answers, on: :create
  validates :body, presence: true

  scope :correct, -> { where(correct: true) }

  private

  def max_answers
    errors.add(:base, 'Only 4 answers for question') if question.answers.count >= 4
  end
end
