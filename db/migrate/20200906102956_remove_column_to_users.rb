class RemoveColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :total_price, :integer
    remove_column :users, :difference_price, :integer
  end
end
