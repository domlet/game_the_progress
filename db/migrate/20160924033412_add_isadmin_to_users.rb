class AddIsadminToUsers < ActiveRecord::Migration[5.0]
  def up
    change_column_default :users, :is_admin, true
  end

  def down
    change_column_default :users, :is_admin, nil
  end
end
