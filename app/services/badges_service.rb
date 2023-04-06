# frozen_string_literal: true

class BadgesService
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
    @badges = Badge.all.select do |badge|
      send("#{badge.rule_type}_type?", badge.rule_option)
    end
  end

  def category_type?(category_id)
    return false if @test_passage.test.category_id.to_s != category_id

    tests = Test.where(category_id:).pluck(:id)
    user_passes = @user.successful_passes.where(test: tests).pluck(:test_id).uniq

    tests.count == user_passes.count
  end

  def first_try_type?(_option)
    test_passages = @user.test_passages.where(test_id: @test_passage.test_id)

    test_passages.count == 1 && test_passages.exists?(success: true)
  end

  def level_type?(level)
    return false if @test_passage.test.level != level

    user_passes_count = successful_passes_for_level(level).count
    level_tests_count = Test.where(level:).count

    user_passes_count == level_tests_count
  end

  def successful_passes_for_level(level)
    tests = Test.where(level:).pluck(:id)
    @user.successful_passes.select { |pass| tests.include?(pass.test_id) }
  end
end
