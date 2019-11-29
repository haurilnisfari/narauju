class ApplicationController < ActionController::Base

  private

  def load_popular_posts
    @popular_posts = Post.popular
  end
end
