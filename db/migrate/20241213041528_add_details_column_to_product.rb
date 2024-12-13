class AddDetailsColumnToProduct < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :detail, :text
  end
end
