class VotesController < ApplicationController
  def vote_up
    post = Post.find params[:post_id]
    post.votes.create
    redirect_to root_path
  end

  def vote_down
    post = Post.find params[:post_id]
    post.votes.first.delete if post.votes.first
    redirect_to root_path
  end
end

