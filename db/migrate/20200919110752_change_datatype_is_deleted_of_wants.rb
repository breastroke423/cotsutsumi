class ChangeDatatypeIsDeletedOfWants < ActiveRecord::Migration[5.2]
  def change
   change_column :wants, :status, :integer, default: 0, null: 0
  end
end
