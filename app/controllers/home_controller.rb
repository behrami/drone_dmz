class HomeController < ApplicationController
  def index
    customer_id = params[:id]
    customer_type = params[:accType]
    if customer_type == 'Patron'
      @patron=Patron.find_by(id: customer_id)
    elsif customer_type == 'Pilot'
      @pilot=Pilot.find_by(id: customer_id)
    end
  end
end
