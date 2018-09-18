class UsersBoolColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_role, :boolean, default: true
    remove_column :users, :admin, :boolean
    add_column :users, :admin_role, :boolean, default: false
  end
end
