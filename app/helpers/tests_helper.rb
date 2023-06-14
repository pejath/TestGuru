# frozen_string_literal: true

module TestsHelper
  TEST_LEVELS = { 0 => 'Easy', 1 => 'Elementary', 2 => 'Advanced', 3 => 'Hard' }.freeze

  def test_level(test)
    TEST_LEVELS[test.level] || 'Hero'
  end

  def mobile_device?
    agent = request.user_agent
    return true if agent =~ /Mobile|webOS/
    return false
  end
end
