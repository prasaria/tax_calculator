module Manager
  module TaxProducts
    # Filter Service Object for tax_products
    class Filter

      def initialize(args={})
        # @collection & @params are instance variables, can be accessed anywhere inside filter class
        @params = args
        @collection = []
      end

      def execute
        filtered_collection()
        user_tax_product_views = create_user_tax_product_views()
        return user_tax_product_views
      end

      private

      def filtered_collection()
        # Set variables from @params
				name = @params[:name]
        tax_code = @params[:tax_tax_code]
        # Chaining Scopes
        @collection = ::TaxProduct.all
        @collection = @collection.filter_name(name) if name
        @collection = @collection.filter_tax_code(tax_code) if tax_code
      end

      def create_user_tax_product_views()
        product_views = []
        @collection.each() do |product|
          product_view = ::View::UserTaxProduct.new(product)
          product_views << product_view
        end
        return product_views
      end

    end
  end
end