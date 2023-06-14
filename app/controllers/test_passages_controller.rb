# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result]

  def show; end

  def result
    @prev_passages = current_user.test_passages.order(:created_at).reverse[1..2]
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    respond_to do |format|
      if @test_passage.completed? || params[:times_up]
        BadgesService.new(@test_passage).call
        # TestsMailer.completed_test(@test_passage).deliver_now
        format.js { render js: "window.location='#{result_test_passage_path(@test_passage)}'" }
      else
        format.html { render :show }
        format.js
      end
    end

  rescue
    redirect_to result_test_passage_path(@test_passage)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
