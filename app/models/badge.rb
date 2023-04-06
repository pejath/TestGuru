# frozen_string_literal: true

class Badge < ApplicationRecord
  IMG_URLS = { common: 'https://cdn-icons-png.flaticon.com/512/4387/4387567.png',
               gold: 'https://cdn-icons-png.flaticon.com/512/4387/4387828.png',
               epic: 'https://cdn-icons-png.flaticon.com/512/4387/4387818.png' }.freeze

  has_many :achievements, dependent: :delete_all
  has_many :users, through: :achievements

  validates :name, :image_url, :rule_type, presence: true
end
