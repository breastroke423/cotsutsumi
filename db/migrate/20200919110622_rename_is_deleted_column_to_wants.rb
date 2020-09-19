class RenameIsDeletedColumnToWants < ActiveRecord::Migration[5.2]
  def change
    rename_column :wants, :is_deleted, :status
  end
end
