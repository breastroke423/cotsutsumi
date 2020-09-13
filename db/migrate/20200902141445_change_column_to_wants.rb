class ChangeColumnToWants < ActiveRecord::Migration[5.2]
def up
  change_column_default :wants, :count, 0
end

def down
  change_column_default :wants, :count
end
end
