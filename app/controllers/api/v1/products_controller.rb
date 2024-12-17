class Api::V1::ProductsController < ApplicationController

  def index
    @products = Product.all

    if @products
      render json: @products, status: :ok
    else
      render json: { error: 'Products not found'}, status: :not_found
    end
  end


  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end
  
  def show
    @product = Product.find(params[:id])
    if @product
      render json: @product
    else
      render json: { error: 'Order not found' }
    end
  end

  def update
    if @product.update
      render json: @product, status: :update
    else
      render @product.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @product.destroy
      render json: @product, head: :no_content
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  private

  def product_params
    params.require(:product).permit(
      :name,
      :description,
      :category,
      :price,
      :sku,
      :stocklevel,
      :reorderlevel
      )
  end

end

