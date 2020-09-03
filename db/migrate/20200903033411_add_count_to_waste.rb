class AddCountToWaste < ActiveRecord::Migration[5.2]
  def change
    add_column :wastes, :count, :integer, default: '0'
  end
end
