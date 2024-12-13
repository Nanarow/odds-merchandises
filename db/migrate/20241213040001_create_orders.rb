class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.string :fullname
      t.string :phone_number
      t.string :address
      t.float :total_price
      t.references :promotion, null: true, foreign_key: true

      t.timestamps
    end
  end
end
