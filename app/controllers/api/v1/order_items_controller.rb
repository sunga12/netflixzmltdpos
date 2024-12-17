class Api::V1::OrderItemsController < ApplicationController


def index
  current_user = User.find(params[:user_id])
  current_order = current_user.orders.find(params[:order_id])
  @order_items = current_order.order_items.all

  if @order_items
    render json: @order_items, status: :ok
  else
    render json: { error: 'Order Items not found' }, status: :unprocessable_entity
  end

end

def show
  current_user = User.find(params[:user_id])
  current_order = current_user.orders.find(params[:order_id])
  @order_items = current_order.order_items.all

  @order_item = @order_items.find(params[:id])

  if @order_item
    render json: @order_item
  else
    render json: { error: 'Order Item not found' }, status: :unprocessable_entity
  end
end

def create
  current_user = User.find(params[:user_id])
  current_order = current_user.orders.find(params[:order_id])
  @order_items = current_order.order_items.all

  @order_item = current_order.order_items.new(order_item_params)

  if @order_item.save
    render json: @order_item, status: :created
  else
    render json: @order_item.errors, status: :unprocessable_entity
  end
end

def update
  if @order_item.update(order_item_params)
    render json: @order_item, status: :ok
  else
    render json: @order_item.errors, status: :unprocessable_entity
  end
end

def destroy
  if @order_item.destroy
    render json: { message: 'Order item removed successfully' }, head: :no_content
  else
    render json: @order_item.errors, status: :unprocessable_entity
  end
end

private

def order_item_params
  params.permit(:quantity, :price)
end


end
