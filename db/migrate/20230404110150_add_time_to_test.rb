class AddTimeToTest < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :time, :integer, default: 5
  end
end
