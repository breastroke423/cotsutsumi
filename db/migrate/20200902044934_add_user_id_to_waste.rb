class AddUserIdToWaste < ActiveRecord::Migration[5.2]
  def change
    add_column :wastes, :user_id, :integer
  end
end
