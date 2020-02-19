class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save # => false / true
      redirect_to @restaurant, notice: 'Restaurant was successfully created.'
    else
    # redirect_to new_restaurant_path WRONG!
        render :new # please render new.html.erb!
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :category, :address)
  end
end
