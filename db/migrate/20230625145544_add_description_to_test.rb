class AddDescriptionToTest < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :description, :string, null: true
  end
end
