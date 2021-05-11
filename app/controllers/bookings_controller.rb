class BookingsController < ApplicationController
  before_action :find_booking, except: [:index]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user

    if @booking.save
      redirect_to @booking, notice: "Booking was successfully created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    redirect_to @booking
  end

  def destroy
    @booking.update(status: "inactive")
    redirect_to bookings_path, notice: "Successfully deactivated"
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :price, :storage_space_id)
  end
end
