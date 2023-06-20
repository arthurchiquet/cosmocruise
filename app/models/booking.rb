class Booking < ApplicationRecord
  belongs_to :trip
  belongs_to :user

  validates_presence_of :start_date, :end_date
end
