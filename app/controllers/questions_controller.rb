# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :set_test, only: %i[new create]
  before_action :set_question, only: %i[show edit update destroy]

  # GET /questions/1 or /questions/1.json
  def show; end

  # GET /test/(:id)/questions/new
  def new
    @question = @test.questions.build
  end

  # GET questions/(:id)/edit
  def edit; end

  # POST /test/(:id)/questions or /test/(:id)/questions.json
  def create
    @question = @test.questions.build(question_params)

    if @question.save
      redirect_to question_url(@question), notice: 'Question was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PUT /test/(:id)/questions or /test/(:id)/questions.json
  def update
    if @question.update(question_params)
      redirect_to question_url(@question), notice: 'Question was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /test/(:id)/questions/1 or /test/(:id)/questions/1.json
  def destroy
    @question.destroy
    redirect_to test_url(@question.test), notice: 'Question was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def question_params
    params.require(:question).permit(:body)
  end
end
