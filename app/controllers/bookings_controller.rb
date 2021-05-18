class BookingsController < ApplicationController
  before_action :find_booking, except: [:index, :new, :create, :my_bookings]
  before_action :find_storage_space, except: [:index, :edit, :update,  :show, :my_bookings]

  def index
    @bookings = Booking.all
  end

  def my_bookings
    @bookings = current_user.bookings
  end

  def show
    @review = Review.new(booking: @booking)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.storage_space = @storage_space
    @booking.price = calculate_price

    if @booking.save

      redirect_to @booking, notice: "Booking was successfully created"
    else
      render :new
    end
  end

  def edit
    @storage_space = @booking.storage_space
  end

  def update
    @booking.update(booking_params)
    @storage_space = @booking.storage_space
    @booking.price = calculate_price
    @booking.save
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

  def find_storage_space
    @storage_space = StorageSpace.find(params[:storage_space_id])
  end

  def calculate_price
    (@booking.end_date - @booking.start_date) * @storage_space.base_price
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :price, :storage_space_id)
  end
end
