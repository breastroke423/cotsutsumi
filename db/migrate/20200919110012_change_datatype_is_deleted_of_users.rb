class ChangeDatatypeIsDeletedOfUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :is_deleted, :boolean, default: false, null: false
  end
end
