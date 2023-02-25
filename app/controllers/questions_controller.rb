# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :set_test
  before_action :set_question, only: %i[show edit update destroy]

  # GET /test/(:id)/questions or /test/(:id)/questions.json
  def index
    @questions = Question.all
    # render json: { questions: Question.all }
  end

  # GET /test/(:id)/exact_questions
  def exact_questions
    # @questions = @test.questions
    render json: { question: @test.questions }
  end

  # GET /test/(:id)/questions/1 or /test/(:id)/questions/1.json
  def show; end

  # GET /test/(:id)/questions/new
  def new
    @test.questions.build
    # render file: 'app/views/questions/form.html.erb'
  end

  # GET /test/(:id)/questions/1/edit
  def edit; end

  # POST /test/(:id)/questions or /test/(:id)/questions.json
  def create
    # @question = Question.new(question_params)
    @question = @test.questions.build(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to test_question_url(@test, @question), notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test/(:id)/questions/1 or /test/(:id)/questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to test_question_url(@test, @question), notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test/(:id)/questions/1 or /test/(:id)/questions/1.json
  def destroy
    respond_to do |format|
      if @question.destroy
        format.html { redirect_to test_questions_url, notice: 'Question was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { redirect_to test_questions_url, notice: 'Something went wrong.' }
      end
    end
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
    params.require(:question).permit(:body, :test_id)
  end
end
