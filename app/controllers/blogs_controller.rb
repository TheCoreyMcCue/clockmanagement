class BlogsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_blog, only: %i[show edit update destroy]
  def index
    # @blogs = Blog.all
    @blogs = policy_scope(Blog).order(created_at: :desc)
    @latest_blogs = Blog.order(:created_at).limit(5)

  end

  def show
    authorize(@blog)
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
    authorize(@blog)
  end

  def edit
    authorize(@blog)
  end

  def create
    @blog = Blog.new(blog_params)
    @user = current_user
    @blog.user = @user
    authorize @blog
    @blog.save
    redirect_to blogs_path
  end

  def update
    authorize(@blog)
    @blog.update(blog_params)
    redirect_to blogs_path(@blog)
  end

  def destroy
    authorize(@blog)
    @blog.destroy
    redirect_to blogs_url
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :body, :subject, :user_id, :photo)
  end
end
