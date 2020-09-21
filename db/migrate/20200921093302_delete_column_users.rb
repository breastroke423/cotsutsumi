class DeleteColumnUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :count, :integer
  end
end
