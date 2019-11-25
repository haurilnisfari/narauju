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
    @post = Post.find(params[:id])
    @categories = Category.all
    @category_ids = @post.category_ids
  end

  #when we run edit method then we update the database by update method
  def update
    # render plain: params.inspect #to inspect what kind of params that be return value of this method
    post = Post.find(params[:id]) #catch the post which has the active id
    post.attributes = resource_params #update the post with attributes not update method in order to saving the update in the end, bzos we have a unsaved categories
    category_ids = params[:post][:categories] #catch the categories of the current post
    post.category_ids = category_ids #assign the new category_ids with the updated category
    post.save # ya save lah
    redirect_to post_path(post) #redirect ke post yg bersangkutan
  end

  def destroy
    @post = Post.find(params[:id]) #catch the post which has the active id
    @post.destroy 
    redirect_to posts_path
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
