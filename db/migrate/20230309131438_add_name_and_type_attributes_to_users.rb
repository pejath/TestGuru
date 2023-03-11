# frozen_string_literal: true

class AddNameAndTypeAttributesToUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :role
    add_column :users, :type, :string, null: false, default: 'User'
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
  end
end
