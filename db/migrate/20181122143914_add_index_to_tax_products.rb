class AddIndexToTaxProducts < ActiveRecord::Migration[5.2]
  def change
    add_index :tax_products, :name, unique: true
  end
end
