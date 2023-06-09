# frozen_string_literal: true

class AddSuccessToTestPassage < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passages, :success, :boolean, null: false, default: false
  end
end
