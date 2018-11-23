module Api
  module V1
    class TaxProductsController < ApplicationController
  
      # Metadata concern, for pagination using will paginate
      include Metadata
      # before run destroy method, run the set_tax_products first
      before_action :set_tax_products, only: [:destroy]
    
      # Create method for POST http:://localhost:3003/tax_products
      def create
        # Using service object to create a tax_product
        tax_product = ::Manager::TaxProducts::Create.execute(create_params)
        render json: tax_product,  root: 'tax_product', status: :created
      end
    
      # Index method for GET http:://localhost:3003/tax_products
      def index
        # Using service object to fetch all tax_products
        tax_products = ::Manager::TaxProducts::Filter.new(params: filter_params).execute()
                        .paginate(page: params[:page], per_page: params[:per_page])
    
        render json: tax_products, root: 'tax_products', each_serializer: ::View::UserTaxProductSerializer, 
          meta: pagination_dict(tax_products)
      end
    
      # Update method for PATCH http:://localhost:3003/tax_products/:id
      def update
        # Using service object to update a single tax_product data
        tax_product = ::Manager::TaxProducts::Update.execute(update_params, id: params[:id])
        render json: tax_product, root: 'tax_product'
      end
    
      # Show method for GET http:://localhost:3003/tax_products/:id
      def show
        # Using service object show to display single tax_product
        tax_products = ::Manager::TaxProducts::Show.execute(params[:id])
        render json: tax_products, root: 'tax_product', serializer: ::View::UserTaxProductSerializer
      end
    
      # Destroy method for DELETE http:://localhost:3003/tax_products/:id
      def destroy
        # using destroy!, if action failed will rollback and raise error message that will be catched in application_controller(parent of this controller)
        @tax_product.destroy!
        head :ok
      end
    
      private
    
      def set_tax_products
        # Set instance variables tax_products to be used for another method later
        @tax_product = ::TaxProduct.find_by_id!(params[:id])
      end
    
      def create_params
        params.require(:tax_product)
              .permit(:name, :tax_code, :price)
      end
    
      def filter_params
        params.permit(:name, :tax_code, :page, :per_page)
      end
    
      def update_params
        params.require(:tax_product)
              .permit(:name, :tax_code, :price)
      end
      
    end
  end
end
