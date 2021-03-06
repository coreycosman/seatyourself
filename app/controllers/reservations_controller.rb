class ReservationsController < ApplicationController

  def create
    @reservation = Reservation.new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation.date = params[:reservation][:date]
    @reservation.time = params[:reservation][:time]
    @reservation.party_size = params[:reservation][:party_size]


    @reservation.restaurant_id = @restaurant.id
    @reservation.user_id = current_user.id

    if @reservation.save
      flash.notice = "Reservation has been successfully created."
      redirect_to restaurants_path
    else
      render "restaurants/show"
    end
  end


end
