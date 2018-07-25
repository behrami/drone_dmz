class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new
    @booking.pilot_id = params[:booking][:pilot_id]
    @booking.patron_id = params[:booking][:patron_id]
    @booking.summary = params[:booking][:summary]
    one = params[:booking]["when(1i)"].to_i
    two = params[:booking]["when(2i)"].to_i
    three = params[:booking]["when(3i)"].to_i
    @booking.when = DateTime.new(one, two, three)

    if @booking.save
      redirect_to session_bookings_path
    else
      render :new
    end

  end

  def index
    @bookings = Booking.all
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    render :index
  end
end
