# frozen_string_literal: true

class TestPassage < ApplicationRecord
  PASS_SCORE = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_question, on: %i[create update]

  def completed?
    current_question.nil?
  end

  def questions_count
    test.questions.count
  end

  def current_question_num
    test.questions.index(current_question) + 1
  end

  def successfully_completed?
    percentage >= 85
  end

  def percentage
    correct_questions / questions_count.to_f * 100
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    self.success = successfully_completed?
    save!
  end

  private

  def set_question
    if current_question.nil?
      self.current_question = test.questions.first if test.present?
    else
      self.current_question = next_question
    end
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
