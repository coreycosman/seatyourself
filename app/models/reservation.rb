class Reservation < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  validate :check_reservation

  def check_reservation
    counter = 0
    Reservation.all.each do |r|
      counter += r.party_size
    end
    if restaurant && party_size && restaurant.capacity < party_size + counter
      errors[:base] << 'There are no more seats available for this time!'
    end
  end

end
