class CreateWants < ActiveRecord::Migration[5.2]
  def change
    create_table :wants do |t|
      t.string :name
      t.integer :price
      t.text :reason
      t.integer :count

      t.timestamps
    end
  end
end
