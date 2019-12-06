class ChangeColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :role, :integer, default: 0, null: false
    change_column :users, :is_active, :boolean, default: true, null: false
  end
end
