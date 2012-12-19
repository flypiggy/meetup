class SessionsController < ApplicationController

  def new
  end

  def create
    if session[:token] = User.auth_user(params[:username], params[:password])
      redirect_to root_path, notice: "welcome back!"
    else
      redirect_to login_path, alert: "Wrong Username or Password"
    end
  end

  def destroy
    session[:token] = nil
    redirect_to root_path
  end

end
