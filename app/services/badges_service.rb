# frozen_string_literal: true

class BadgesService
  include Rules

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @badges = []
  end

  def call
    check_rules
    @user.badges.push(@badges)
  end

  private

  def check_rules
    @badges = Badge.all.map do |badge|
      "BadgesService::#{to_class(badge)}".constantize.call(badge.rule_option, @test_passage, @user)
    end
  end

  def to_class(badge)
    "#{badge.rule_type.camelize}Rule"
  end
end
