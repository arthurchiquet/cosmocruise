require "date"

class BookingsController < ApplicationController
  before_action :set_booking, only: [:destroy]
  before_action :set_trip, only: [:new, :create]


  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.trip = @trip
    @booking.user = current_user
    @booking.status = false
    @booking.nb_days = Date.parse(booking_params["end_date"]) - Date.parse(booking_params["start_date"])
    @booking.total_price = @booking.nb_days * @trip.price_per_day
    if @booking.save
      redirect_to @trip
    else
      render "trips/show", status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    redirect_to trip_path(@booking.trip), status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end
end
