# frozen_string_literal: true

class Test < ApplicationRecord
  def self.test_by_category_name(category_tile)
    joins('join categories on tests.category_id = categories.id')
      .where(categories: { title: category_tile }).order(title: :desc)
      .pluck(:title)
  end
end
