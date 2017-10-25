class Reservation < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  validates :party_size, presence: true
  validate :check_reservation
  validate :check_date


  def check_reservation
    return unless party_size && date && time
    already_booked = restaurant.reservations.where(time: time).where(date: date).sum(:party_size)
    available = restaurant.capacity - already_booked
    if available < party_size
      errors[:base] << 'There are no more seats available for this time!'
    end
  end

  def check_date
    return unless date
      if date < Date.today
      errors[:base] << 'This Date Has Passed!'
      end
  end











end
