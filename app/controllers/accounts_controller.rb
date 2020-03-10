class AccountsController < ApplicationController
  before_action :load_popular_posts, except: [:create, :destroy]
  before_action :load_categories, except: [:create, :destroy]

  def new
    @user = User.new
  end

  def create
    user = User.new(resource_params)
    user.save
    redirect_to new_account_path
  end

  def resource_params
    params.require(:user).permit(:name, :username, :password)
  end
end
