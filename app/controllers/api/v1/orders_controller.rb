class Api::V1::OrdersController < ApplicationController

  def index
    current_user = User.find(params[:user_id])
    @orders = current_user.orders.all

    if @orders
      render json: @orders, status: :ok
    else
      render json: { error: 'Orders not found' }, status: :not_found
    end
  end

  def show
    current_user = User.find(params[:user_id])
    @order = current_user.orders.new(order_params)

    if @order
      render json: @order
    else
      render json: { error: 'Order not found' }
    end

  end

  def create
    @order = current_user.orders.new(order_params)
    if @order.save
      render json: @order, status: :created
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def update
    if @order.update(order_params)
      render json: @order, status: :ok
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @order.destroy
      render json: @order, head: :no_content
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.permit(:date, :total)
  end
end
