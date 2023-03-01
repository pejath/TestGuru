# frozen_string_literal: true

module TestPassagesHelper
  def result_message(test_passage)
    if test_passage.successfully_completed?
      content_tag(:div) do
        content_tag(:p, 'You are successfully completed test with:') +
          content_tag(:h2, "#{test_passage.percentage}%", color: :green)
      end
    else
      content_tag(:div) do
        content_tag(:p, 'You are failed test, your percentage was:') +
          content_tag(:h2, "#{test_passage.percentage}%", color: :red)
      end
    end
  end

  def current_question_helper(test_passage)
    "Current Question: #{test_passage.current_question_num} / #{test_passage.questions_count}"
  end
end
