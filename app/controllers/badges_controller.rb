# frozen_string_literal: true

class BadgesController < ApplicationController
  def index
    @badges = Badge.all
  end

  def achieved
    @badges = current_user.badges
  end
end
