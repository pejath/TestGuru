# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :results
  has_many :users, through: :results

  def self.test_by_category_name(category_tile)
    joins(:category).where(categories: { title: category_tile })
                    .order(title: :desc).pluck(:title)
  end
end
