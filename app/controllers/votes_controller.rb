class VotesController < ApplicationController
  def create
    post = Post.find params[:post_id]
    if ["voteup","votedown"].include?(params[:vote])
      vote = post.votes.new vote_action: params[:vote]
      vote.user = current_user
      vote.save
    end

    redirect_to root_path
  end
end
