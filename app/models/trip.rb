class Trip < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  has_one_attached :vessel_photo

  validates_presence_of :title, :description, :category, :location, :price_per_day, :departure, :nb_travelers_max, :nb_days_min, :vessel, :photo, :vessel_photo
end 
