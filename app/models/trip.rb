class Trip < ApplicationRecord
  belongs_to :user

  validates_presence_of :title, :description, :category, :location, :price_per_day
end
