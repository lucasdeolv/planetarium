class PlanetsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @planets = Planet.all
  end

  def new
    @planet = Planet.new
  end

  def create
    @planet = Planet.new(planet_params)
  end

  def show
    @planet = Planet.find(params[:id])
  end

  def edit
    @planet = Planet.find(params[:id])
  end

  def update
  end

  def destroy
    @planet = Planet.destroy
    redirect_to planets_path
  end

  def planet_params
    params.require(:planet).permit(:name, :galaxy, :price, :size, :temperature, :pressure)
  end
end
