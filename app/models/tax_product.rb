# == Schema Information
#
# Table name: tax_products
#
#  id       :bigint(8)        not null, primary key
#  name     :string(255)      not null
#  price    :decimal(10, )    not null
#  tax_code :integer          not null
#
# Indexes
#
#  index_tax_products_on_name  (name) UNIQUE
#

class TaxProduct < ActiveRecord::Base
  
  # Enum value of tax_code => Food = 0, Tobacco = 1, Entertainment = 2
  #enum tax_code: [:food, :tobacco, :entertainment]

  # Product Scopes
  scope :filter_name, ->(name) { where('name LIKE ?', "%#{name}%") }    
  scope :filter_tax_code, ->(tax_code) { where(tax_code: tax_code) }

end
