class CommentsController < ApplicationController
  def create
    post = Post.find params[:post_id]
    comment = post.comments.new content: params[:content]
    if comment.save
      flash[:notice] = "Your comment is add successfully."
      redirect_to comment.post
    else
      flash[:error] = "Content can't be blank."
      redirect_to comment.post
    end
  end
end
