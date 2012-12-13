class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find params[:id]
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new params[:post]

    if @post.save
      flash[:notice] = "Your post successed."
      redirect_to root_path
    else
      flash[:error] = "Title & Url can't be blank."
      render :new
    end
  end
end
