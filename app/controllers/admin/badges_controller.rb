# frozen_string_literal: true

class Admin::BadgesController < Admin::BaseController
  before_action :set_badge, only: %i[show edit update destroy]

  def index
    @badges = Badge.all
  end

  def show; end

  def new
    @badge = Badge.new
    @categories = Category.all
  end

  def edit; end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badge_url(@badge), notice: 'Badge was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badge_url(@badge), notice: 'Badge was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_url, notice: 'Badge was successfully destroyed.'
  end

  private

  def set_badge
    @badge = Badge.find(params[:id])
    @categories = Category.all
  end

  def badge_params
    params.require(:badge).permit(:name, :image_url, :rule_type, :rule_option)
  end
end
