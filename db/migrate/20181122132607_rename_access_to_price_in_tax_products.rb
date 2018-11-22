class RenameAccessToPriceInTaxProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :tax_products, :access, :price
  end
end
