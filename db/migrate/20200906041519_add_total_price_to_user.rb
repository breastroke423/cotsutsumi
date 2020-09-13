class AddTotalPriceToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :total_price, :integer
  end
end
