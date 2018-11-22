class CreateTaxProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :tax_products do |t|
      t.string :name, null: false
      t.integer :tax_code, null: false
      t.decimal :access, null: false
    end
  end
end
