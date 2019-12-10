class HomeController < ApplicationController

  def index
    @posts = Post.published
    load_popular_posts
    load_categories
  end
end
