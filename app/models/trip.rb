class Trip < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates_presence_of :title, :description, :category, :location, :price_per_day, :photo
end
