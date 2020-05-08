class HomeController < ApplicationController

  def index
    load_popular_posts
    load_categories
    load_recent_posts
    load_recent_comments
    @posts = Post.search(params[:search]).page params[:page]
  end
end
