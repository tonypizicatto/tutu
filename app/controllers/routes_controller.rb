class RoutesController < ApplicationController
  before_action :set_routes, only: [:show, :edit, :destroy, :update]

  def index
    @routess = Routes.all
  end

  def show
  end

  def new
    @routes = Routes.new
  end

  def create
    @routes = Routes.new(routes_params)
    if @routes.save
      redirect_to @routes
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @routes.update(routes_params)
      redirect_to @routes
    else
      render :edit
    end
  end

  def destroy
    @routes.destroy
    redirect_to routess_path
  end

  private

  def set_routes
    @routes = Routes.find(params[:id])
  end

  def routes_params
    params.require(:routes).permit(:name)
  end

end