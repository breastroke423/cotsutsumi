class AddPurchasePriceToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :purchase_price, :integer, default: '0'
  end
end
