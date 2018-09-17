class ProductsAndOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.column :item, :string
      t.column :price, :bigint
    end
  end
end
