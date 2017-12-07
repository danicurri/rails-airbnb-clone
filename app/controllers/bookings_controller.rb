class BookingsController < ApplicationController
before_action :set_flat
  def index
    @bookings = Booking.all
    @my_bookings = current_user.bookings
  end

  def new
    @booking = Booking.new

  end

  def create
    @booking = Booking.new(booking_params)
    @booking.flat = @flat
    @booking.total_price = @flat.price * @booking.number_nights
    @booking.user = current_user #current_user

    if @booking.save
      redirect_to flat_bookings_path(@flat)
    else
      render 'flats/show'
    end
  end

  def edit
  end

  def show
    set_booking
  end

  def update
    @booking.update(booking_params)
    @booking.save
    redirect_to flat_booking_path(@booking)
  end

  def destroy
    set_booking
    @booking.destroy
    redirect_to root_path
  end

  def approve
    set_booking
    @booking.status = "approved"
    redirect_to bookings_path
  end

  private

    def booking_params
      params.require(:booking).permit(:initial_date, :number_nights)
    end

    def set_flat
      @flat = Flat.find(params[:flat_id])
    end

    def set_booking
      @booking = Booking.find(params[:id])
    end
end
