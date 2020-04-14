class AccountsController < ApplicationController
  before_action :load_popular_posts, except: [:destroy]
  before_action :load_categories, except: [:destroy]
  
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
