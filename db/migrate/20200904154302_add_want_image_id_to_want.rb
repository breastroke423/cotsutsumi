class AddWantImageIdToWant < ActiveRecord::Migration[5.2]
  def change
    add_column :wants, :want_image_id, :string
  end
end
