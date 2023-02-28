# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :set_test, only: %i[show edit update destroy]

  def index
    @tests = Test.all
  end

  def show
    @questions = @test.questions
  end

  def new
    @test = Test.new
  end

  def edit; end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to test_url(@test), notice: 'Test was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @test.update(test_params)
      redirect_to test_url(@test), notice: 'Test was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_url, notice: 'Test was successfully destroyed.'
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :author_id, :category_id)
  end
end
