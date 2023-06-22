require "date"

class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy, :update]
  before_action :set_trip, only: [:new, :create]


  def index
    @bookings = Booking.all
    @host_bookings = Booking.select { |booking| booking.trip.user == current_user }
    @user_bookings = Booking.select { |booking| booking.user == current_user }
  end

  def show
  end

  def create
    start_date = booking_params[:start_date][0..9]
    end_date = booking_params[:start_date][-10..-1]
    @booking = Booking.new(booking_params)
    @booking.end_date = end_date
    @booking.trip = @trip
    @booking.user = current_user
    @booking.status = false
    if end_date && start_date
      @booking.nb_days = Date.parse(end_date) - Date.parse(start_date)
      @booking.total_price = @booking.nb_days * @trip.price_per_day * @booking.nb_travelers
    end
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render "trips/show", status: :unprocessable_entity
    end
  end

  def update
    @booking.status = true
    @booking.save
    redirect_to booking_path(@booking)
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :nb_travelers)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end
end
