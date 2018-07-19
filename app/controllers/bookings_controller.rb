class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new
    @booking.acc_type = params[:booking][:acc_type]
    @booking.first_name = params[:booking][:first_name].capitalize
    @booking.last_name = params[:booking][:last_name].capitalize
    @booking.email = params[:booking][:email]
    @booking.phone = params[:booking][:phone]
    @booking.cost = params[:booking][:cost]
    @booking.summary = params[:booking][:summary]
    @booking.country = params[:booking][:country].capitalize
    @booking.state = params[:booking][:state].capitalize
    @booking.city = params[:booking][:city].capitalize
    @booking.street = params[:booking][:street]
    @booking.postal_code = params[:booking][:postal_code]

    if @booking.save
      FormSubmitMailer.notify_form_submit(@booking).deliver
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

  def show
    id = params[:id]
    @customer = Booking.find_by(id: id)
  end

  def destroy
    booking_id = params[:id]
    Booking.find_by(id: booking_id).delete
    redirect_to session_bookings_path
  end
end
