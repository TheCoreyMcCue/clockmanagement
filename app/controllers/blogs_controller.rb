class BlogsController < ApplicationController

  def index
  @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
  end

  def edit

  end

  def create
    @blog = Blog.new(blog_params)
    # @user = current_user
    # @blog.user = @user
    @blog.save
    redirect_to chair_path(@blog)
    # authorize @blog
  end

  def update
    # authorize(@blog)
    @blog.update(blog_params)
    redirect_to blog_path(@blog)
  end

  def destroy
    authorize(@blog)
    @blog.destroy
    redirect_to blogs_url
  end


end
