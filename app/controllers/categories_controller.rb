class CategoriesController < ApplicationController
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
    @category = Category.find(params[:id])
  end

  def update
    flash[:notice] = "Category has been updated"
    category = Category.find(params[:id])
    category.update(resource_params)
    redirect_to category_path(category)
  end

  def destroy
    category = Category.find(params[:id])
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
    id = params[:id]
    @category = Category.find(id)
  end

  private

  def resource_params
    params.require(:category).permit(:name)
  end

end
