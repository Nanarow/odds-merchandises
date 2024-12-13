class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :detail
      t.float :price

      t.timestamps
    end
  end
end
