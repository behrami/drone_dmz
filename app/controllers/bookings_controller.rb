class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new
    @booking.first_name = params[:booking][:first_name]
    @booking.last_name = params[:booking][:last_name]
    @booking.email = params[:booking][:email]
    @booking.phone = params[:booking][:phone]
    @booking.cost = params[:booking][:cost]
    @booking.summary = params[:booking][:summary]
    @booking.country = params[:booking][:country]
    @booking.state = params[:booking][:state]
    @booking.city = params[:booking][:city]
    @booking.street = params[:booking][:street]
    @booking.postal_code = params[:booking][:postal_code]

    if @booking.save
      redirect_to booking_path(@booking.id)
    else
      render :new
    end
  end

  def index
    @bookings = Booking.all
  end

  def destroy
    booking_id = params[:id]
    Booking.find_by(id: booking_id).delete
    redirect_to session_bookings_path
  end
end
