class Booking < ApplicationRecord
  belongs_to :trip
  belongs_to :user

  validates_presence_of :start_date, :end_date, :nb_travelers
  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
 end
end
