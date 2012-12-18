class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if token = User.auth_user(params[:username], params[:password])
      session[:token] = token
      redirect_to root_path, notice: "welcome back!"
    else
      render :new, error: "wrong!"
    end
  end

  def destroy
    session[:token] = nil
    redirect_to root_path
  end

end
