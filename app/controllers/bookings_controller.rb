require "date"

class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy, :update]
  before_action :set_trip, only: [:new, :create]


  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def show
  end

  def update
    @booking.status = true
    @booking.save
    redirect_to bookings_path
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.trip = @trip
    @booking.user = current_user
    @booking.status = false
    if booking_params["end_date"] > booking_params["start_date"]
      @booking.nb_days = Date.parse(booking_params["end_date"]) - Date.parse(booking_params["start_date"])
      @booking.total_price = @booking.nb_days * @trip.price_per_day
    end
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path, status: :see_other
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
