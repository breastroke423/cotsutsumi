class CreateSavings < ActiveRecord::Migration[5.2]
  def change
    create_table :savings do |t|
      t.integer :price
      t.integer :count

      t.timestamps
    end
  end
end
