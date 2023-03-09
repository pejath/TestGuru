# frozen_string_literal: true

module Admin
  class TestsController < Admin::BaseController
    before_action :set_test, only: %i[show edit update destroy start]

    def index
      @tests = Test.all
    end

    def show; end

    def start
      current_user.tests.push(@test)
      redirect_to current_user.test_passage(@test)
    end

    def new
      @test = Test.new
    end

    def edit; end

    def create
      @test = Test.new(test_params)

      if @test.save
        redirect_to admin_test_url(@test), notice: 'Test was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @test.update(test_params)
        redirect_to admin_test_url(@test), notice: 'Test was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @test.destroy
      redirect_to admin_tests_url, notice: 'Test was successfully destroyed.'
    end

    private

    def set_test
      @test = Test.find(params[:id])
    end

    def test_params
      params.require(:test).permit(:title, :level, :author_id, :category_id)
    end
  end
end
