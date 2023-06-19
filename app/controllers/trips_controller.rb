class TripsController < ApplicationController
  before_action :set_trip, only: %i[show]

  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
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

  private

  def trip_params
    params.require(:trip).permit(:title, :description, :location, :category, :price_per_day)
  end

  def set_trip
    @trip = Trip.find(params[:id])
  end

end
