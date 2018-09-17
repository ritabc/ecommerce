class OrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.column :quantity, :integer
      t.column :product_id, :integer
      t.column :order_id, :integer
    end
  end
end
