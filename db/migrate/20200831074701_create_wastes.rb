class CreateWastes < ActiveRecord::Migration[5.2]
  def change
    create_table :wastes do |t|
      t.string :name
      t.integer :price
      t.text :reason

      t.timestamps
    end
  end
end
