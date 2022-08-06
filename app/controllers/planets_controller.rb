class PlanetsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :pundit_policy_scoped?, only: :index

  def index
    if params[:query]
      @planets = Planet.global_search(params[:query])
    else
      @planets = policy_scope(Planet)
    end
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
    params[:planet][:bought] = false if params[:planet][:bought] == "false"
    if @planet.update(planet_params)
      if params[:planet][:bought] == false
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
    params.require(:planet).permit(:name, :galaxy, :price, :size, :temperature, :pressure, :image, :bought, :description)
  end

  private

  def pundit_policy_scoped?
    true
  end
end
