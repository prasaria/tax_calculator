module TaxProducts
  # This is a validation class for creating tax_product, name should be unique!
  class CreateValidator

    include ActiveModel::Model

    validates_presence_of :name, :tax_code, :price

    validate :uniqueness_of_name, :valid_tax_code, :valid_price
    
    def initialize(tax_product)
      # Basic Details
      @name = tax_product.name
      @tax_code = tax_product.tax_code
      @price = tax_product.price
    end
    
    private
    
    def uniqueness_of_name
      errors.add(:name, 'is taken.') if ::TaxProduct.where(name: name).exists?
    end

    def valid_tax_code
      tax_codes = [1,2,3]
      errors.add(:tax_code, 'must be between [1,2,3]') unless tax_codes.include? (@tax_code)
    end

    def valid_price
      errors.add(:price, 'must be greater than zero') if @price <= 0
    end
    
    attr_reader :name, :tax_code, :price
    
  end
end
