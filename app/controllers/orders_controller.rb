class OrdersController < ApplicationController
  def index
    @orders = policy_scope(Order)
  end

  def new
    @order = Order.new
    authorize(@order)
    @planet = Planet.find(params[:planet_id])
  end

  def create
    @order = Order.new
    authorize(@order)
    @order.user = current_user
    @planet = Planet.find(params[:planet_id])
    @order.planet = @planet
    if @order.save
      redirect_to planets_path
    else
      render :new
    end
  end

  def show
    authorize(@order)
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:planet_id)
  end
end
