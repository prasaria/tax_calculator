module Manager
  module TaxProducts
    # Create Service Object for tax_products
    class Create
      
      def self.execute(params)
        tax_product = ::TaxProduct.new(params)
        # check if the seller object is valid, email, phone and username is unique
        validator = ::TaxProducts::CreateValidator.new(tax_product)
        raise Errors::ValidationError.new(validator.errors.messages) unless validator.valid?
        tax_product_created = ::TaxProduct.create!(params) 
        return tax_product_created
      end

    end
  end
end