class UsersController < ApplicationController
  before_filter :require_logged_in, only: [:edit, :update]
  before_filter :find_current_user, only: [:edit, :update]


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
    @recent_tweets = @user.twitter.blank? ? nil : Twitter.user_timeline(@user.twitter, count: 10)
  end

  def edit
  end

  def update
    if @user.update_attributes params[:user]
      redirect_to @user, notice: "update successfull."
    else
      render :edit
    end
  end

  private
  def find_current_user
    @user = User.find_by_token session[:token]
  end
end
