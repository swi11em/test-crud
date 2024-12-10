class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :set_flat, only: [:show, :destroy]
  def index
    @flats = Flat.all
  end

  def show
    @booking = Booking.new()
  end

  def new
    @flat = Flat.new()
  end

  def create
    @flat = Flat.new(flat_parmas)
    @flat.save

  end

  def update
  end

  def destroy
    @flat.destroy
  end

  private

  def flat_parmas
    params.require(:flat).permit(:title, :description, :rating, :image_url)
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end
end
