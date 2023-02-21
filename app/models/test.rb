# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id, optional: false

  has_many :results, dependent: :destroy
  has_many :users, through: :results

  def self.test_by_category_name(category_tile)
    joins(:category)
      .where(categories: { title: category_tile })
      .order(title: :desc)
      .pluck(:title)
  end
end
