# -*- SkipSchemaAnnotations

module View
  # Representation of an Tax Product that contains with tax calculation data for user view
  # Tax Product
  # { 
  #   "id": 1,
  #   "name": "Big Mac",
  #   "tax_code": "1",
  #   "type": "food",
  #   "refundable": yes,
  #   "price": 10000,
  #   "tax": 1000,
  #   "amount": 11000
  # }
  class UserTaxProduct < ActiveModelSerializers::Model
    # :id refers to :entity_id in Product table.
    attributes :id, :name, :tax_code, :type, :refundable, :price,  :tax, :amount

    def initialize(tax_product)
      # static tax_code, tax_code 1 = Food & Beverage, tax_code 2 = Tobacco, tax_code 3 = Entertainment
      @id = tax_product.id
      @name = tax_product.name
      @tax_code = tax_product.tax_code
      @price = tax_product.price
      set_view_attributes()
    end

    private

    def set_view_attributes()
      @type = set_product_type(@tax_code)
      @refundable = set_refundable(tax_code)
      @tax = calculate_tax(@tax_code)
      @amount = calculate_amount()
    end

    def set_product_type(tax_code)
      product_type = ["None", "Food & Beverage", "Tobacco", "Entertainment"]
      return product_type[tax_code]
    end

    def set_refundable(tax_code)
      refund_type = ["No", "Yes"]
      return refund_type[0] unless tax_code == 1
      return refund_type[1] if tax_code == 1
    end

    def calculate_amount()
      return @price + @tax
    end

    def calculate_tax(tax_code)
      tax = set_non_entertainment_tax(tax_code) if tax_code == 1 || tax_code == 2
      tax = set_entertainment_tax() if tax_code == 3
      return tax
    end

    def set_non_entertainment_tax(tax_code)
      tax_result = (10 * @price ) / 100 if tax_code == 1
      tax_result = 10 + (2 * price / 100) if tax_code ==  2
      return tax_result
    end

    def set_entertainment_tax()
      tax_result = 0 if @price > 0 && @price < 100
      tax_result = 1 / 100 * ( @price - 100) if price >= 100
      return tax_result
    end

  end
end