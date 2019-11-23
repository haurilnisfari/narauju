class PostsController < ApplicationController
  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    # title = params[:post][:title]
    # body = params[:post][:body]
    # post = Post.new(title: title, body: body)
    # post.save

    # BESOK YANG RELASINYA PAKAI OBJEK
    post = Post.new(resource_params)
    category_ids = params[:post][:categories]
    post.category_ids = category_ids
    post.save

    redirect_to posts_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
    @posts = Post.all
  end

  def show
    id = params[:id]
    @post = Post.find(id)
    puts @post
  end

  private

  def resource_params
    params.require(:post).permit(:title, :body)
  end


end
