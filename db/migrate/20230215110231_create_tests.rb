# frozen_string_literal: true

class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, null: false, default: 1
      t.belongs_to :author, foreign_key: { to_table: :users }
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
