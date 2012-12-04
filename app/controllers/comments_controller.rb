class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @post = Post.find params[:post_id]
  end

  def create
    @comment = Comment.new params[:comment]
    @comment.post_id = params[:post_id]
    @comment.save
    redirect_to post_path(@comment.post)
  end

end
