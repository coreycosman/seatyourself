class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_many :users, through: :reservations
  validates :name, :opening_time, :closing_time, :capacity, presence: true
  
end
