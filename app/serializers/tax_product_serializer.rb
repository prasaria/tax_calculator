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

class TaxProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :tax_code, :price
end
