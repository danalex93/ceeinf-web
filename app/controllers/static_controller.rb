class StaticController < ApplicationController
  def index
  	@pinned_posts = Post.where(pinned: true).order(created_at: :desc)
  end

  def about
  end
end
