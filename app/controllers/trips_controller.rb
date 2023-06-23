class TripsController < ApplicationController
  before_action :set_trip, only: %i[show edit update destroy]

  def index
    @user_trips = Trip.select { |trip| trip.user == current_user }
    if params[:location].present? && params[:price_max].present?
      @trips = Trip.where(location: params[:location]).where("price_per_day <= ?", params[:price_max])
    elsif params[:location].present?
      @trips = Trip.where(location: params[:location])
    elsif params[:price_max].present?
      @trips = Trip.where("price_per_day < ?", params[:price_max])
    else
      @trips = Trip.all
    end
    params[:location] = nil
    params[:price_max] = nil
    @markers = @trips.geocoded.map do |trip|
      {
        lat: trip.latitude,
        lng: trip.longitude
      }
    end
  end

  def show
    @trip = Trip.find(params[:id])
    @disbaled_dates = []
    @trip.bookings.each do |booking|
      @disbaled_dates.push(
        {
            from: booking.start_date,
            to: booking.end_date
        }
      )
    end
    @booking = Booking.new
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    if @trip.save
      redirect_to trips_path, notice: "List was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @trip.update(trip_params)
    redirect_to trip_path(@trip)
    flash[:success] = "Trip successfully updated"
  end

  def destroy
    @trip.destroy
    redirect_to trips_path, status: :see_other
  end

  private

  def trip_params
    params.require(:trip).permit(:title, :description, :location, :category, :price_per_day, :photo, :departure, :nb_days_min, :nb_travelers_max, :vessel, :vessel_photo)
  end

  def set_trip
    @trip = Trip.find(params[:id])
  end
end
