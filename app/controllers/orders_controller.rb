class OrdersController < ApplicationController
  def new
    @order = Order.new
    @planet = Planet.find(params[:planet_id])
    skip_authorization
  end

  def create
    @order = Order.new
    @order.user = current_user
    @planet = Planet.find(params[:planet_id])
    @order.planet = @planet
    if @order.save
      skip_authorization
      redirect_to planets_path
    else
      render :new
    end
  end

  def show
    @order = Order.find(params[:id])
    skip_authorization
  end

  def order_params
    params.require(:order).permit(:planet_id)
  end
end
