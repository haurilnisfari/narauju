class HomeController < ApplicationController

  def index
    load_popular_posts
    load_categories
    @posts = Post.search(params[:search])
  end
end
