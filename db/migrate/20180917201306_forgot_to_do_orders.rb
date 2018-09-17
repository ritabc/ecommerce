class ForgotToDoOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.column :status, :string
      t.column :user_id, :bigint
      t.column :total_price, :decimal
    end
    remove_column :products, :price
    add_column :products, :price, :decimal
  end
end
