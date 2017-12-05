class FlatsController < ApplicationController

def index
  @flats = Flat.all
end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_strong_params)
    @flat.owner = User.first
    @flat.save
    redirect_to flat_path(@flat)
  end

  def show
    @flat = Flat.find(params[:id])
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

  private

  def flat_strong_params
    params.require(:flat).permit(:description, :title, :address, :price)
  end

end
