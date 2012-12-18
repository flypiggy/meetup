class CommentsController < ApplicationController
  before_filter :require_logged_in, only: [:create]

  def create
    post = Post.find params[:post_id]
    comment = post.comments.new content: params[:content]
    comment.user = current_user

    if comment.save
      flash[:notice] = "Your comment is add successfully."
      redirect_to comment.post
    else
      flash[:error] = "Content can't be blank."
      redirect_to comment.post
    end
  end
end
