class FlatsController < ApplicationController

  def index
    @flats = Flat.all

    @flats = Flat.where.not(latitude: nil, longitude: nil)

    @markers = Gmaps4rails.build_markers(@flats) do |flat, marker|
      marker.lat flat.latitude
      marker.lng flat.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end


  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_strong_params)
    @flat.owner = current_user
    @flat.save
    redirect_to flat_path(@flat)
  end

  def show
    @booking = Booking.new
    @flat = Flat.find(params[:id])
    @alert_message = "You are viewing #{@flat.title}"
    @flat_coordinates = { lat: @flat.latitude, lng: @flat.longitude }

  end

  def edit
    @flat = Flat.find(params[:id])
  end

  def update
    @flat = Flat.find(params[:id])
    @flat.update(flat_strong_params)
    @flat.save
    redirect_to flat_path(@flat)
  end

  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy
    redirect_to root_path
  end

  def index
  @flats = if params[:loaction]
    Flat.where('name LIKE ?', "%#{params[:location]}%")
  else
    Flat.all
  end
end

  private

  def flat_strong_params
    params.require(:flat).permit(:description, :title, :address, :price, :photo, :photo_cache)
  end

end
