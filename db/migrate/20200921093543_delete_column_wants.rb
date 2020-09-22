class DeleteColumnWants < ActiveRecord::Migration[5.2]
  def change
    remove_column :wants, :count, :integer
  end
end
