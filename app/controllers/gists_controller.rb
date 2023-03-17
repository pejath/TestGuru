# frozen_string_literal: true

class GistsController < ApplicationController
  before_action :set_test_passage

  def create
    gist = GistQuestionService.new(@test_passage.current_question).call

    flash_options = if gist.success?
                      current_user.gists.create(question: @test_passage.current_question, url: gist.url)
                      { notice: t('.success', href: "<a href='#{gist.url}' target='_blank'>gist.github.com</a>") }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to @test_passage, flash_options
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
