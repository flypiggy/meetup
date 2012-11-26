class MainController < ApplicationController
  def index
    @post = Post.all

  end
end
