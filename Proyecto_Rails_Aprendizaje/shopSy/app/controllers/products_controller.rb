class ProductsController < ApplicationController
    def index
        @categories = Category.all.order(name: :asc)
        # @products -> Es una variable de instancia para poder usarla en el template
        
            # Asi estaba antes de refactorizar la logica en un query object pattern
        #  @products = Product.with_attached_photo
        # if params[:category_id]
        #     @products = @products.where(category_id: params[:category_id])
        # end
        # if params[:min_price].present?
        #     @products = @products.where("price >= ?",params[:min_price])
        # end
        # if params[:max_price].present?
        #     @products = @products.where("price <= ?",params[:max_price])
        # end
        # if params[:query_text].present?
        #     @products = @products.search_full_text(params[:query_text])
        # end
        
        # order_by = Product::ORDER_BY.fetch(params[:order_by]&.to_sym,Product::ORDER_BY[:newest])

        # #order_by[params[:order_by]]
        # @products = @products.order(order_by) 
        
        @pagy, @products = pagy_countless(FindProducts.new.call(product_params_index),items: 12)
    end

        # [:id] -> id dinamico
    def show
        #@product = Product.find(params[:id])
        product
    end

    def new
        #@product = Product.new
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)
        if @product.save
            redirect_to products_path, notice: t('.created')
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        #@product = Product.find(params[:id])
        product
    end

    def update
        #@product = Product.find(params[:id])
        if product.update(product_params)
            redirect_to products_path, notice: t('.updated')
        else
            render :edit, status: :unprocessable_entity 
        end
    end


    def destroy
        #@product = Product.find(params[:id])
        product.destroy
        redirect_to products_path, notice: t('.destroyed'), status: :see_other

    end

    private 
    def product_params
        params.require(:product).permit(:title,:description,:price, :photo,:category_id)
    end

    def product_params_index
        params.permit(:category_id,:min_price,:max_price,:query_text,:order_by)
    end

    def product
        @product = Product.find(params[:id])
    end
end