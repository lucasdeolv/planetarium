class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
  end

  def show
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit
  end
end
