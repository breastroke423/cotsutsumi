class ChageColumnToUser < ActiveRecord::Migration[5.2]
  def change
        change_column :users, :total_price, :integer
  end
end
