class Trip < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  validates_presence_of :title, :description, :category, :location, :price_per_day, :photo
end
