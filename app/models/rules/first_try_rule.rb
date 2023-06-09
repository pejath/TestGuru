# frozen_string_literal: true

module Rules
  class FirstTryRule
    def self.call(_option, test_passage, user)
      test_passages = user.test_passages.where(test_id: test_passage.test_id)

      test_passages.count == 1 && test_passages.exists?(success: true)
    end
  end
end
