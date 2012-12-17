class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new params[:user]
    if @user.save
      flash[:notice] = "Create success!  #{@user.username}"
      redirect_to root_path
    else
      flash[:error] = "Wrong input"
      render :new
    end

  end
end
