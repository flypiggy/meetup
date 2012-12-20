class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new params[:user]
    if @user.save
      redirect_to root_path, notice: "Create success!  #{@user.username}"
    else
      flash[:error] = "Wrong input"
      render :new
    end
  end

  def show
    @user = User.find params[:id]
    @recent_posts = @user.posts.order("updated_at DESC").limit(10)
    @recent_comments = @user.comments.order("updated_at DESC").limit(10)
    @recent_votes = @user.votes.order("updated_at DESC").limit(10)
    @recent_tweets = Twitter.user_timeline "flypiggys", count: 10
  end
end
