# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def test_passage_params
    params.require(:test_passage).permit(:user_id, :test_id, :current_question_id, :correct_questions)
  end
end
