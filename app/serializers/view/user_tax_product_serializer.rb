module View
  # Serializer for non-persistent view of TaxProduct for Users
  class UserTaxProductSerializer < ActiveModel::Serializer

    attributes :id, :name, :tax_code, :type, :refundable, :price,  :tax, :amount
  end
end