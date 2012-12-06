class CommentsController < ApplicationController
  def create
    comment = Comment.new content: params[:content]
    comment.post_id = params[:post_id]
    comment.save
    redirect_to comment.post
  end
end
