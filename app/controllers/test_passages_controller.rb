# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    gist_question = GistQuestionService.new(@test_passage.current_question)
    result = gist_question.call
    gist_url = result.html_url

    flash_options = if gist_question.success?
                      current_user.gists.create(question: @test_passage.current_question, url: gist_url)
                      { notice: t('.success', href: "<a href='#{gist_url}' target='_blank'>gist.github.com</a>") }
                    else
                      { alert: t('.failure')}
                    end

    redirect_to @test_passage, flash_options
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
