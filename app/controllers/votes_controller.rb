class VotesController < ApplicationController
  def create
    post = Post.find params[:post_id]
    post.votes.create vote_action: params[:vote] if ["voteup","votedown"].include?(params[:vote])
    redirect_to root_path
  end
end
