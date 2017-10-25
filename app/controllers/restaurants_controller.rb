class RestaurantsController < ApplicationController

  before_action :ensure_logged_in, except: [:index, :show]
  before_action :ensure_ownership, only: [:edit, :update, :destroy]

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
    @restaurant.user = current_user
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def edit
    find_restaurant

  end

  def update
    find_restaurant
    if @restaurant && @restaurant.update(restaurant_params)
      redirect_to root_path
    else
      flash.now[:alert] = @restaurant.error.full_messages
      render :edit
    end
  end

  def destroy
    find_restaurant
    @restaurant.destroy

  end

    private

      def restaurant_params
        params.require(:restaurant).permit(:name, :opening_time, :closing_time, :capacity, :user_id)
      end

      def find_restaurant
        @restaurant = Restaurant.find(params[:id])
      end
end
