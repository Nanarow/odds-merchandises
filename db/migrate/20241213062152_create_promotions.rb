class CreatePromotions < ActiveRecord::Migration[8.0]
  def change
    create_table :promotions do |t|
      t.string :code
      t.string :name
      t.float :discount_value

      t.timestamps
    end
  end
end
