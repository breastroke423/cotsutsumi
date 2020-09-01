class AddUserIdToWant < ActiveRecord::Migration[5.2]
  def change
    add_column :wants, :user_id, :integer
  end
end
