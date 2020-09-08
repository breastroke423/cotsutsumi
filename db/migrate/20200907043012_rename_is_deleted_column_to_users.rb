class RenameIsDeletedColumnToUsers < ActiveRecord::Migration[5.2]
  def change
      change_column_default :users, :is_deleted, from: "t", to: false

  end
end
