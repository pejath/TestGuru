# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id, optional: true

  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :time, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  scope :level, ->(level) { where(level:) }

  scope :by_category, ->(category_title) { joins(:category).where(categories: { title: category_title }) }

  def self.titles_by_category(category_title)
    by_category(category_title).pluck(:title)
  end
end
