class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find params[:id]
    @comments = @post.comments
    @comment = Comment.new
  end

  def new
  end

  def create
    Post.create title: params[:title], url: params[:url]
    redirect_to root_path
  end

end
