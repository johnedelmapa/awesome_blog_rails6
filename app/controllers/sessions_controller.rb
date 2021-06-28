class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      #login user
      log_in(user)
      flash[:success] = "Successfully logged in."
      redirect_to root_url
    else
      #redirect back to the login_url
      flash[:danger] = "Invalid Credentials"
      redirect_to login_url 
    end
  end

  def destroy
    log_out
    flash[:success] = "Successfully logout."
    redirect_to root_url
  end
end
