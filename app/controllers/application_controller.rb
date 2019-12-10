class ApplicationController < ActionController::Base

  private

  def load_popular_posts
    @popular_posts = Post.popular
  end

  def load_categories
    @categories = Category.all
  end

end
