# frozen_string_literal: true

class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :email, null: false
      t.string :body, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
