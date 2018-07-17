class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash.now[:notice] = 'Successful Sign In'
      session[:user_id] = user.id
      redirect_to session_bookings_path(acc_type: 'Patron')
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Successful Sign Out'
    redirect_to root_path
  end
end
