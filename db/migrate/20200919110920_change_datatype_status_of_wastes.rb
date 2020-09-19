class ChangeDatatypeStatusOfWastes < ActiveRecord::Migration[5.2]
  def change
   change_column :wastes, :status, :integer, default: 0, null: 0
  end
end
