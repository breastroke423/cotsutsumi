class RenameDifferencePriceToUser < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :defference_price, :difference_price
  end
end
