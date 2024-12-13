class CreateOrderDetails < ActiveRecord::Migration[8.0]
  def change
    create_table :order_details do |t|
      t.integer :quantity
      t.float :total_price
      t.references :order, null: true, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
