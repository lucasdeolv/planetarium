class PlanetsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
