class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end


  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path
    else
      render :new
    end
  end

  def edit
    find_restaurant
  end

  def update
    find_restaurant
    if @restaurant.save(restaurant_params)
      redirect_to restaurants_path
    else
      render :edit
    end
  end

    private

      def restaurant_params
        params.require(:restaurant).permit(:name, :opening_time, :closing_time, :capacity, :user_id)
      end

      def find_restaurant
        @restaurant = Restaurant.find(params[:id])
      end
end
