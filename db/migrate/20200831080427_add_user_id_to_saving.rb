class AddUserIdToSaving < ActiveRecord::Migration[5.2]
  def change
    add_column :savings, :user_id, :integer
  end
end
