class PlanetsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @planets = Planet.all
    skip_policy_scope
  end

  def new
    @planet = Planet.new
    skip_authorization
  end

  def create
    @planet = Planet.new(planet_params)
    @planet.user = current_user
    @planet.save
    skip_authorization
    redirect_to planets_path
  end

  def show
    @planet = Planet.find(params[:id])
    skip_authorization
  end

  def edit
    @planet = Planet.find(params[:id])
  end

  def update
    @planet = Planet.find(params[:id])
    if @planet.update(planet_params)
      redirect_to planet_path(@planet)
    else
      render 'new'
    end
  end

  def destroy
    @planet = Planet.find(params[:id])
    authorize @planet
    @planet.destroy
    redirect_to planets_path
  end

  def planet_params
    params.require(:planet).permit(:name, :galaxy, :price, :size, :temperature, :pressure)
  end
end
