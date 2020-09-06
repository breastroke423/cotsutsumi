class ChangeTotalPriceToUser < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :total_price, :string,  default: 0
  end

  def down
    change_column :users, :total_price, :string
  end
end
