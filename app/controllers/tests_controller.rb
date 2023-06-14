# frozen_string_literal: true

class TestsController < ApplicationController
  def index
    if params[:category_id].nil?
      @tests = Test.all
    else
      @tests = Test.where(category_id: params[:category_id])
    end

    unless params[:level].nil?
      @tests = @tests.level(params[:level])
    end

    @passages = current_user.test_passages.order(:created_at).last(21).reverse
    @level_select = Test.all.group_by(&:level).keys
  end

  def start
    @test = Test.find(params[:id])
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end
end
