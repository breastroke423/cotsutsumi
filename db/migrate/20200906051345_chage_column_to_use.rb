class ChageColumnToUse < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :difference_price, :integer
  end
end
