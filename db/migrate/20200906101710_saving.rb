class Saving < ActiveRecord::Migration[5.2]
  def change
    drop_table :savings
  end
end
