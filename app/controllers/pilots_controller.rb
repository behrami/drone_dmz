class PilotsController < ApplicationController
  def new
    @pilot = Pilot.new
  end

  def create
    @pilot = Pilot.new
    @pilot.first_name = params[:pilot][:first_name].capitalize
    @pilot.last_name = params[:pilot][:last_name].capitalize
    @pilot.email = params[:pilot][:email]
    @pilot.phone = params[:pilot][:phone]
    @pilot.driver_license = params[:pilot][:driver_license]
    @pilot.drone_number = params[:pilot][:drone_number]
    @pilot.cost = params[:pilot][:cost]
    @pilot.available_days = params[:pilot][:available_days]
    @pilot.summary = params[:pilot][:summary]
    @pilot.country = params[:pilot][:country].capitalize
    @pilot.state = params[:pilot][:state].capitalize
    @pilot.city = params[:pilot][:city].capitalize
    @pilot.street = params[:pilot][:street]
    @pilot.postal_code = params[:pilot][:postal_code]

    if @pilot.save
      FormSubmitMailer.notify_form_submit_pilot(@pilot).deliver
      redirect_to root_path(id: @pilot.id, accType: 'Pilot')
    else
      flash.now[:danger] = 'Please make sure you have filled the form correctly'
      render :new
    end
  end

  def index
    @pilots = Pilot.all
  end

  def show
    id = params[:id]
    @pilot = Pilot.find_by(id: id)
  end

  def destroy
    pilot_id = params[:id]
    Pilot.find_by(id: pilot_id).delete
    redirect_to session_pilots_path
  end
end
