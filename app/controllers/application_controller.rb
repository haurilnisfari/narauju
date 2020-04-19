class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  private

  def load_popular_posts
    @popular_posts = Post.popular
  end

  def load_recent_posts
    @recent_posts = Post.recent
  end

  def load_recent_comments
    @recent_comments = Comment.recent
  end

  def load_categories
    @categories = Category.all
  end

  def logged_in?
    current_user
  end

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_session_path
    end
  end

end
