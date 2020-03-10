class SessionsController < ApplicationController
  before_action :load_popular_posts, except: [:create, :destroy]
  before_action :load_categories, except: [:create, :destroy]

  def new
  end

  def create
    username = params[:username]
    password = params[:password]

    user = User.find_by(username: username)
    if user
      if user.authenticate(password)
        redirect_to root_path
      else
        redirect_to new_session_path, notice: 'Username atau password salah'
      end
    else
      redirect_to new_session_path, notice: 'Username atau password salah'
    end
  end
end
