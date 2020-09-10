class AddIsDeletedToWants < ActiveRecord::Migration[5.2]
  def change
    add_column :wants, :is_deleted, :string, default: false
  end
end
