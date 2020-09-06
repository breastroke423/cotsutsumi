class AddDifferencePriceToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :defference_price, :integer
  end
end
