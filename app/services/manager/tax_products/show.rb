module Manager
  module TaxProducts
    # Show Service Object for tax_products
    class Show

      def self.execute(params)
        tax_product = ::TaxProduct.find_by_id!(params)
        product_view = ::View::UserTaxProduct.new(tax_product)
        return product_view
      end

    end
  end
end