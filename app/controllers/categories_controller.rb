class CategoriesController < ApplicationController
  before_action :load_popular_posts, except: [:create, :destroy]
  before_action :load_categories, except: [:create, :destroy]

  def new
    @category = Category.new
  end

  def create
    flash[:notice] = "Category has been created"
    category = Category.new(resource_params)
    category.save
    redirect_to categories_path
  end

  def edit
    @category = Category.friendly.find(params[:id])
  end

  def update
    flash[:notice] = "Category has been updated"
    category = Category.friendly.find(params[:id])
    category.update(resource_params)
    redirect_to category_path(category)
  end

  def destroy
    category = Category.friendly.find(params[:id])
    post_category = PostCategory.find_by(category_id: category.id)
    if post_category
      flash[:notice] = "Category cannot be deleted"
    else
      category.destroy
      flash[:notice] = "Category has been deleted"
    end
    redirect_to categories_path
  end

  def index
    @categories = Category.all
  end

  def show
    category = Category.friendly.find(params[:id])
    id = category.id
    post_ids = PostCategory.where(category_id: id).pluck(:post_id)
    @posts = Post.where(id: post_ids)

    render 'home/index'
  end

  private

  def resource_params
    params.require(:category).permit(:name)
  end

end
