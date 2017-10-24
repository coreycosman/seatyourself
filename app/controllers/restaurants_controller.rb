class RestaurantsController < ApplicationController

  before_action :ensure_logged_in, except: [:index]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def show
    @reservation = Reservation.new
    find_restaurant
  end


  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def edit
    ensure_ownership
  end

  def update
    ensure_ownership
    if @restaurant && @restaurant.update(restaurant_params)
      redirect_to root_path
    else
      flash.now[:alert] = @restaurant.error.full_messages
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
