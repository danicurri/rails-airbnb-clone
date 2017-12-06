class BookingsController < ApplicationController
before_action :set_flat
  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new

  end

  def create
    @booking = Booking.new(booking_params)
    @booking.flat = @flat
    @booking.total_price = @flat.price * @booking.number_nights
    @booking.user = User.first #current_user
    # raise
    if @booking.save
      redirect_to flat_booking_path(@flat, @booking)
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
    @booking.destroy
    redirect_to root_path
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
