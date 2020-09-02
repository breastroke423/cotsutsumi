class ChangeColumnToUser < ActiveRecord::Migration[5.2]
def up
  change_column_default :users, :is_deleted, true
end

def down
  change_column_default :users, :is_deleted
end
end
