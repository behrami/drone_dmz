class PatronsController < ApplicationController
  def new
    @patron = Patron.new
  end

  def create
    @patron = Patron.new
    @patron.first_name = params[:patron][:first_name].capitalize
    @patron.last_name = params[:patron][:last_name].capitalize
    @patron.email = params[:patron][:email]
    @patron.phone = params[:patron][:phone]
    @patron.cost = params[:patron][:cost]
    @patron.summary = params[:patron][:summary]
    @patron.country = params[:patron][:country].capitalize
    @patron.state = params[:patron][:state].capitalize
    @patron.city = params[:patron][:city].capitalize
    @patron.street = params[:patron][:street]
    @patron.postal_code = params[:patron][:postal_code]

    if @patron.save
      FormSubmitMailer.notify_form_submit_patron(@patron).deliver
      redirect_to root_path(@patron.id)
    else
      flash.now[:danger] = 'Please make sure you have filled the form correctly'
      render :new
    end
  end

  def index
    @patrons = Patron.all
  end

  def show
    id = params[:id]
    @patron = Patron.find_by(id: id)
  end

  def destroy
    patron_id = params[:id]
    Patron.find_by(id: patron_id).delete
    redirect_to session_patrons_path
  end
end
