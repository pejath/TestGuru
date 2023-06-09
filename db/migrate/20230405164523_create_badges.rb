# frozen_string_literal: true

class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :image_url, default: 'https://cdn-icons-png.flaticon.com/512/4387/4387567.png'
      t.string :rule_type, null: false
      t.string :rule_option

      t.timestamps
    end
  end
end
