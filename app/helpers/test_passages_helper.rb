# frozen_string_literal: true

module TestPassagesHelper
  def current_question_helper(test_passage)
    "Current Question: #{test_passage.current_question_num} / #{test_passage.questions_count}"
  end
end
