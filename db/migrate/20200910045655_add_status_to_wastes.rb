class AddStatusToWastes < ActiveRecord::Migration[5.2]
  def change
    add_column :wastes, :status, :string, default: 0
  end
end
