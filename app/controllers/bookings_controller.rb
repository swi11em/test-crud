class BookingsController < ApplicationController
  def new
  end

  def create
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.new(booking_params)
    @booking.flat = @flat
    @booking.user = current_user

    if @booking.save
      redirect_to flat_path(@flat), notice: "Booking created successfully!"
    else
      flash.now[:alert] = "Booking could not be created."
      render "flats/show", status: :unprocessable_entity
    end
  end

  def edit
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
