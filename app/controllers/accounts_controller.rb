class AccountsController < ApplicationController
  before_action :load_popular_posts, except: [:destroy]
  before_action :load_categories, except: [:destroy]
  http_basic_authenticate_with name: Rails.application.credentials.http_basic_auth[:username], password: Rails.application.credentials.http_basic_auth[:password], only: [:new]

  def new
    @user = User.new
  end

  def create
    @user = User.new(resource_params)

    if @user.save
      flash[:notice] = "Account has been created"
      redirect_to @user
    else
      render "new"
    end
  end

  def resource_params
    params.require(:user).permit(:name, :username, :password, :password_confirmation)
  end
end
