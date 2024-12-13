class CreateBillings < ActiveRecord::Migration[8.0]
  def change
    create_table :billings do |t|
      t.string :fullname
      t.string :phone_number
      t.text :address
      t.float :total_price
      t.references :promotion, null: true, foreign_key: true

      t.timestamps
    end
  end
end
