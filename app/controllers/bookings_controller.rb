class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new
    @booking.acc_type = params[:booking][:acc_type]
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
      flash.now[:danger] = 'Please make sure you have filled the form correctly'
      render :new
    end
  end

  def index
    acc_type = params[:acc_type]
    @bookings = Booking.where(acc_type: acc_type)
  end

  def destroy
    booking_id = params[:id]
    Booking.find_by(id: booking_id).delete
    redirect_to session_bookings_path
  end
end
