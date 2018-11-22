module Manager
  module TaxProducts
    # Update Service Object for tax_products
    class Update
   
      def self.execute(update_params, id_params)
        tax_product = ::TaxProduct.find_by_id!(id_params[:id])
        updated_tax_product = tax_product
        updated_tax_product.assign_attributes(update_params)
        validator = ::TaxProducts::UpdateValidator.new(updated_tax_product)
        raise Errors::ValidationError.new(validator.errors.messages) unless validator.valid?
        tax_product.update!(update_params)
        return updated_tax_product
      end

    end
  end
end