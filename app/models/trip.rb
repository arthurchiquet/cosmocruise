class Trip < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  has_one_attached :vessel_photo
  geocoded_by :departure
  after_validation :geocode, if: :will_save_change_to_departure?

  validates_presence_of :title, :description, :category, :location, :price_per_day, :departure, :nb_travelers_max, :nb_days_min, :vessel, :photo, :vessel_photo

  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end 
