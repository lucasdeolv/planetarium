class PlanetsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @planets = policy_scope(Planet)
  end

  def new
    @planet = Planet.new
    authorize(@planet)
  end

  def create
    @planet = Planet.new(planet_params)
    authorize(@planet)
    @planet.user = current_user
    @planet.save
    redirect_to planets_path
  end

  def show
    @planet = Planet.find(params[:id])
    authorize(@planet)
  end

  def edit
    @planet = Planet.find(params[:id])
    authorize(@planet)
  end

  def update
    @planet = Planet.find(params[:id])
    authorize(@planet)
    if @planet.update(planet_params)
      if params[:planet][:availability]
        redirect_to planets_path
      else
        redirect_to planet_path(@planet)
      end
    else
      render 'edit'
    end
  end

  def destroy
    @planet = Planet.find(params[:id])
    authorize(@planet)
    @planet.destroy
    redirect_to planets_path
  end

  def planet_params
    params.require(:planet).permit(:name, :galaxy, :price, :size, :temperature, :pressure)
  end
end
